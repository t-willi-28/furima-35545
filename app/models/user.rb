class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX =/\A(?=.*[a-z])(?=.*[A-Z])(?=.*[\d])[a-z\d]+\z/i.freeze
  validates :password, 
    format: {with: VALID_PASSWORD_REGEX}
  validates :nickname, presence: true
  validates :first_name, presence: true,
    format: { with:  /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :last_name, presence: true,
    format: { with:  /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name_kana, presence: true,
  format: { with:  /\A[ァ-ヶ一]+\z/}
  validates :last_name_kana, presence: true,
  format: { with:  /\A[ァ-ヶ一]+\z/}
  validates :birth_date, presence: true
end
