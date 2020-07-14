class HomeController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
    @items = Item.includes(:item_images)
  end
end
