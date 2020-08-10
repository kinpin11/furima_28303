require 'rails_helper'
describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

 describe "ユーザー新規登録" do
    context '新規登録がうまくいく時' do
       it "nick_nameとemail、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthが存在すれば登録できる" do
        #  binding.pry   
        expect(@user).to be_valid
       end
       it "passwordが6文字以上であれば登録できる" do
            expect(@user).to be_valid
       end  
          
       it "メールアドレスは@を含めば登録できる" do
          @user.email  = "kkk@gmail.com"
          expect(@user).to be_valid
          
       end
       it "passwordは半角英数字混合で登録できる" do
            expect(@user).to be_valid
       end
       it "passwordは確認用を含めて2回入力すると登録できる" do
            @user.password = "123abc"
            @user.password_confirmation = "123abc"
            expect(@user).to be_valid
       end
       it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力すると登録できる" do
             @user.last_name = "田中"
             @user.first_name = "太郎"
             expect(@user).to be_valid

            
       end
       it "ユーザー本名のフリガナは全角（カタカナ）で入力すると登録できる" do
             @user.last_name_kana = "タナカ"
             @user.first_name_kana = "タロウ"
             expect(@user).to be_valid
       end  
     end


     context '新規登録がうまくいかない時' do
         it "nick_nameが空だと登録できない" do
            @user.nick_name = ""
            @user.valid?
            #binding.pry
            expect(@user.errors.full_messages).to include("Nick name can't be blank")
          end
          it "emailが空だと登録できない" do
               @user.email = ""
               @user.valid?
               #binding.pry
               expect(@user.errors.full_messages).to include("Email can't be blank")
          end
          it "passwordが空だと登録できない" do
               @user.password = ""
               @user.valid?
               #binding.pry
               expect(@user.errors.full_messages).to include("Password can't be blank")

          end
          it "password_confirmationが空だと登録できない" do
               @user.password_confirmation = ""
               @user.valid?
               # binding.pry
               expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
          end

          it "ユーザー本名の名前がそれぞれが空だと登録できない" do
               @user.first_name = ""
               @user.valid?
               #binding.pry
               expect(@user.errors.full_messages).to include("First name can't be blank")
          end
          it "ユーザー本名の名字がそれぞれが空だと登録できない" do
               @user.last_name = ""
               @user.valid?
               #binding.pry
               expect(@user.errors.full_messages).to include("Last name can't be blank")
          end
          it "ユーザー本名のフリガナ名前が空だと登録できない" do
               @user.first_name_kana = ""
               @user.valid?
               #binding.pry
               expect(@user.errors.full_messages).to include("First name kana can't be blank")
          end
          it "ユーザー本名のフリガナ名字が空だと登録できない" do
               @user.last_name_kana = ""
               @user.valid?
               #binding.pry
               expect(@user.errors.full_messages).to include("Last name kana can't be blank")
          end
             
          it "重複したemailが存在する場合登録できない" do
              @user.save
              another_user = FactoryBot.build(:user)
              another_user.email = @user.email
              another_user.valid?
              expect(another_user.errors.full_messages).to include("Email has already been taken")
          end
          it "メールアドレスは@を含めないと登録できない" do
               @user.email  = "kkkgmail.com"
               @user.valid?
               # binding.pry
               expect(@user.errors.full_messages).to include("Email is invalid")
               
            end

          it "passowordが５文字以下だと登録できない" do
             @user.password = "00000"
             @user.password_confirmation = "00000"
             @user.valid?
             expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
          end
          it "passwordが存在してもpassword_confirmationが空では登録できない" do
             @user.password_confirmation = ""
             @user.valid?
             expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
          end

     end
   end
end




