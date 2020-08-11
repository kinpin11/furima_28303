class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show, :search]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  

  def create
    Item.create(item_params)
  end

 private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :ststus_id, :payer_id, :shipping_origin_id, :date_until_shipping_id, :price)

  end

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index 
  #   end
  # end
end
