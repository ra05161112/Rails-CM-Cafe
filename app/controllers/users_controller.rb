class UsersController < ApplicationController

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

end
