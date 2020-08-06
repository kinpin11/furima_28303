require 'rails_helper'
describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nick_nameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.nick_name = ""
      user.valid?
      expect(user.errors.fullmessage).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email  = ""
      user.valid?
      expect(user.errors.full_message).to include("Email can't be blank")
    end
  end 
end


