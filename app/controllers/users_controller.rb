class UsersController < ApplicationController
  before_action :correct_user, only: [:destroy, :edit, :update]

  def show
    @user = User.find(params[:id])
    @vote = Vote.where(user_id: params[:id])
    @total_order = TotalOrder.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  private 
    def user_params
      params.require(:user).permit(:email, :name, :age, :sex, :admin, :recom_count)
    end
    #  #必須  更新（編集の反映）時にパスワード入力を省く
    # def update_resource(resource, params)
    #   resource.update_without_password(params)
    # end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user == @user
      flash.now[:alert] = "他人の情報は編集できません"
    end

end
