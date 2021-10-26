class ItemsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :destroy, :edit, :update]

  def index
    @item = Item.paginate(page: params[:page], per_page:10)
    @user_count = User.count
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
    flash[:notice] = "メニューの削除に成功しました🐇"
    redirect_to("/items")
  end


  private
    def item_params
      params.require(:item).permit(:name, :description, :price, :creation_time, :picture)
    end

    def admin_user
      unless current_user.admin?
        flash[:alert] = "そのページは開けません"
        redirect_to ("/items")
      end
    end

end