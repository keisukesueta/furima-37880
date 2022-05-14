class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  # has_many :orders
  # has_many :comments

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  with_options presence: true do
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

    validates :nickname,           presence: true
    validates :birth_day,          presence: true
    validates :lastname,           presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :firstname,          presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :lastname_kana,      presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :firstname_kana,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  end
end
