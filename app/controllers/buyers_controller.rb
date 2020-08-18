class BuyersController < ApplicationController
  before_action :set_buyer, only: [:index, :create]
  before_action :move_to_index, except: [:index]

  def index
    @user_buyer = UserBuyer.new
  end

  def create
    @user_buyer = UserBuyer.new(buyer_params)
    if @user_buyer.valid?
      pay_item
      @user_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def buyer_params
    params.permit(:item_id, :post_code, :shipping_origin_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def set_buyer
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
