class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show, :search]
  def index
    @items = Item.includes(:user)
    # binding.pry
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

    # def show
    #   @item = @item.includes(:user)
    # end


  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :payer_id, :shipping_origin_id, :date_until_shipping_id, :price, :user_id).merge(user_id: current_user.id)
  end

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
end
