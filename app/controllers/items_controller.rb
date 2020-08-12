class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show, :search]
  def index
    @item = Item.find(1)
   end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = @item.includes(:user)
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :payer_id, :shipping_origin_id, :date_until_shipping_id, :price, :user_id).merge(user_id: current_user.id)
  end
end
