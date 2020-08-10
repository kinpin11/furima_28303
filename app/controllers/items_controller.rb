class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show, :search]
  def index
    @items = Item.all
  end

  def create
  end

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index 
  #   end
  # end
end
