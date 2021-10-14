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


  private
    def item_params
      params.require(:item).permit(:name, :description, :price, :creation_time)
    end

end