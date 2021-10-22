class TotalOrdersController < ApplicationController

  
  def new
    @total_order = TotalOrder.new
    @total_order.orders.build
    @item = Item.all
  end

  def create
    @total_order = TotalOrder.new(order_params)
    if @total_order.save
      flash[:notice] = "注文を受け付けました"
      redirect_to("/total_orders/#{@total_order.id}")
    else
      render "total_orders/new"
    end
  end

  def show
    @total_order = TotalOrder.find(params[:id])
    @order = Order.where(total_order_id: params[:id])
    @item = Item.all
  end

  def destroy
    @total_order = TotalOrder.find(params[:id])
    @total_order.destroy
    redirect_to "/users/#{current_user.id}"
  end
  



  private
  def order_params
    params.require(:total_order).permit(:total_price,:large_time, :last_create_time, :user_id, orders_attributes: [:id, :item_id, :quantity, :_destroy])
  end

end
