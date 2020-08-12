require 'rails_helper'

RSpec.describe Item, type: :model do
  describe  '#create' do
    before do
    
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload(('public/image/output-image1.png'))

    end

  
    context "商品が保存できる場合" do
      it "商品名、画像、説明文、カテゴリー、商品の状態、発送地、値段があること" do
        expect(@item).to be_valid
      end
    end


    context "商品が保存できない場合" do
      it "商品名がない保存できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明がない保存できない" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "画像がないと保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      
      it "カテゴリー説明がない保存できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")

      end
      it "商品の状態についての情報がない保存できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")

      end
      it "配送料の負担についての情報がない保存できない" do
        @item.payer_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Payer can't be blank")
      end
      it "発送元の地域についての情報がない保存できない" do
        @item.shipping_origin_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
      end
      it "発送までの日数についての情報がない保存できない" do
        @item.date_until_shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Date until shipping can't be blank")
      end
      it "価格についての情報がない保存できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲が、¥300以上でないと保存できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it "価格の範囲が、¥9,999,999以下でないと保存できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end

      
    end
  end
end