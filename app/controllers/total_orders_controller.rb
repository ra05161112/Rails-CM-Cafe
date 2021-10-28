class TotalOrdersController < ApplicationController

  
  def new
    @total_order = TotalOrder.new
    @total_order.orders.build
    @item = Item.all
    @time = []
    @item.each do |item|
      @time.push(item.creation_time)
    end
  end

  def create
    @total_order = TotalOrder.new(order_params)
    if @total_order.save
      @a, @b = @total_order.large_time.to_s.split(".")
      flash[:notice] = "注文番号#{@total_order.id}番で注文を承りました。#{@a}分#{@b.to_i * 6}秒後に商品の準備ができます。"
      redirect_to("/total_orders/#{@total_order.id}")
    else
      render "total_orders/new"
    end
  end

  def show
    @total_order = TotalOrder.find(params[:id])
    @order = Order.where(total_order_id: params[:id])
    @item = Item.all
    @total_price = total_price(params[:id])
  end

  def destroy
    @total_order = TotalOrder.find(params[:id])
    @total_order.destroy
    flash[:alert] = "ご利用ありがとうございました。またのご利用をお待ちしております。"
    redirect_to "/users/#{current_user.id}"
  end
  



  private
  def order_params
    params.require(:total_order).permit(:total_price,:large_time, :last_create_time, :user_id, orders_attributes: [:id, :item_id, :quantity, :_destroy])
  end

  def get_creation_tiome
    @find_creation_time = Item.all.to_json(only: [:id, :creation_time])
  end

  def total_price(id)
    @total_order = TotalOrder.find(id)
    @order = Order.where(total_order_id: @total_order.id)
    @price = 0
    @order.each do |o|
      @price += Item.find(o.item_id).price
    end
    return @price
  end

end
