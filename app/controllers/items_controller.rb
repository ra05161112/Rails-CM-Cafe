class ItemsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :destroy, :edit, :update]
  helper_method :sort_column, :sort_direction

  def index
    @item = Item.all.order(sort_column + ' ' + sort_direction).paginate(page: params[:page], per_page:10)
    @user_count = User.count
    @user = User.first
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to("/items")
    else
      render("items/new")
    end
  end

  def show
    @item = Item.find(params[:id])
    @vote = Vote.find_by(user_id: current_user.id, item_id: params[:id])
    @new_vote = Vote.new

  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to("/items/#{@item.id}")
    else
      render("items/edit")
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to("/items")
  end

  def recommend
    if current_user.sex == :男性
      @user = User.where(sex: :男性)
      @vote = sex_votes(:男性)
      @item = Item.where(id: @user.id)
      @users = user_count(:男性).count
    elsif current_user.sex == :女性
      @user = User.where(sex: :女性)
      @item = Item.where(id: @user.id)
      @users = user_count(:女性)
    end

    
  end


  private
    def item_params
      params.require(:item).permit(:name, :description, :price, :creation_time, :picture, :voted_count)
    end

    def admin_user
      unless current_user.admin?
        flash[:alert] = "そのページは開けません"
        redirect_to ("/items")
      end
    end

    def user_count(sex)
      users = []
      user = User.where(sex: sex)
      user.each do |u|
        users.push(u)
      end
      return users
    end

    def sex_votes(sex)
      user = User.where(sex: sex)
      votes = []
      user.each do |u|
        votes.push(Vote.where(user_id: :u.id))
      end
      return votes
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
  
    def sort_column
        Item.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

end