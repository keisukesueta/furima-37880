class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
         #has_many :items
         #has_many :orders
         # has_many :comments 


        with_options presence: true do

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers' 

         validates :nickname,           uniqueness: true
         validates :email,              uniqueness: true
         #validates :encrypted_password, presence: true   
         validates :birth_day,          presence: true 
         validates :lastname,           format: { with: /\A[ぁ-んァ-ン一-龥]/ }  
         validates :firstname,          format: { with: /\A[ぁ-んァ-ン一-龥]/ }  
         validates :lastname_kana,      format: { with: /\A[ァ-ヶー－]+\z/ } 
         validates :firstname_kana,     format: { with: /\A[ァ-ヶー－]+\z/ }
        end
end
