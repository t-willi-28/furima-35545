class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :buyers

  VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-z\d]+\z/i.freeze
  validates :password,
            format: { with: VALID_PASSWORD_REGEX }
  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶ一-]+\z/ }
    validates :last_name_kana, format: { with: /\A[ァ-ヶ一-]+\z/ }
    validates :birth_date
  end
end
