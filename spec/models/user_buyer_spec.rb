require 'rails_helper'

RSpec.describe UserBuyer, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user_buyer = FactoryBot.build(:user_buyer)
    @item = FactoryBot.build(:item)
    @user = FactoryBot.build(:user)
  end

  describe '送付先住所を保存' do
    context "商品が購入できる時場合" do
      
      it "配送先の住所情報が正しい時購入できる" do
        
        expect(@user_buyer).to be_valid
      end
        
    end
    
    context "商品が購入できない場合" do
     
      it "郵便番号が空だと保存できない" do
        @user_buyer.post_code = ""
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Post code is invalid") 
    
      end   
      
      it "郵便番号に、- がないと保存できない" do
        @user_buyer.post_code = "1234567"
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Post code is invalid") 
    
      end    
       
      it "都道府県が空だと保存できない" do
        @user_buyer.shipping_origin_id = ""
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include( "Shipping origin is not a number" )
      end
      it "市区町村が空だと保存できない" do
        @user_buyer.city = ""
        @user_buyer.valid?
  
        expect(@user_buyer.errors.full_messages).to include("City can't be blank") 
      
      end
      it "番地が空だと保存できない" do
        @user_buyer.house_number = ""

        @user_buyer.valid?
       
        expect(@user_buyer.errors.full_messages).to include("House number can't be blank") 
      end
      it "電話番号が空だと保存できない" do
        @user_buyer.phone_number = ""
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Phone number is invalid") 
      end
      it "電話番号がハイフンがあって１２文字以上だと登録保存できない" do
      @user_buyer.phone_number = "123-4567-8900"
      @user_buyer.valid?
      expect(@user_buyer.errors.full_messages).to include("Phone number is invalid") 
      
      end
    end


  end

end
