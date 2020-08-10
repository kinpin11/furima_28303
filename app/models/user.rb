class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true, uniqueness: { case_sensitive: true }
  validates :email, uniqueness: { case_sensitive: true }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :birth, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ンー-龥]+\z/ }, uniqueness: { case_sensitive: true } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }, uniqueness: { case_sensitive: true } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
