class VotesController < ApplicationController

  def new
    @vote = Vote.new
    @item = Item.all
  end

  def create
    @vote = Vote.new(vote_params)
    # @vote.user_id = current_user.id
    # @vote.item_id = params[:item_id]
    if @vote.save
      flash[:notice] = "投票が成功しました🐇"
      redirect_to("/items/#{params[:item_id]}")
    else
      # @item = Item.find(params[:item_id])
      @item = Item.all
      flash[:alert] = @vote.errors.full_messages
      # render "items/show"
      render "votes/new"
    end
  end


  private
    def vote_params
      params.require(:vote).permit(:voting, :user_id, :item_id)
    end

end