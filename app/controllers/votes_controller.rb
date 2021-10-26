class VotesController < ApplicationController

  def new
    @vote = Vote.where(user_id: current_user.id)
    @item = Item.where.not( id: voted_item(current_user.id) )
  end

  def create
    @vote = Vote.new(vote_params)
    # @vote.user_id = current_user.id
    # @vote.item_id = params[:item_id]
    if @vote.save
      @item = Item.find(@vote.item_id) 
      @item.voted_count += 1
      @item.save
      redirect_back(fallback_location: root_path)
    else
      # @item = Item.find(params[:item_id])
      @item = Item.all
      # render "items/show"
      @vote = Vote.where(user_id: current_user.id)
      @item = Item.where.not( id: voted_item(current_user.id) )
      render "votes/new"
    end
  end

  def edit
    @vote = Vote.where(user_id: params[:user_id])
    @item = Item.where.not( id: voted_item(current_user.id) )
  end

  def destroy
    @vote = Vote.find(params[:id])
    if @vote.user_id == current_user.id
      @vote.destroy
      @item = Item.find(@vote.item_id)
      @item.voted_count -= 1
      @item.save
      redirect_back(fallback_location: root_path)  
    end
    
  end


  private
    def vote_params
      params.require(:vote).permit(:item_id, :user_id)
    end

    def voted_item(user_id)
      items = []
      Vote.find_each do |vote|
        items.push(vote.item_id) if vote.user_id == user_id
      end
      return items
    end
end