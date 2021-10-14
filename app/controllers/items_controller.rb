class ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "ok"
      redirect_to("/items/new")
    else
      flash[:alert] = "no"
      render("items/index")
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "編集に成功しました🐇"
      redirect_to("/items/#{@item.id}")
    else
      flash[:alert] = "失敗です"
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
      params.require(:item).permit(:name, :description, :price, :creation_time)
    end

end