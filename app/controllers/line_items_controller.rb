class LineItemsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
     redirect_to cart_path(id: @item)
  end

end
