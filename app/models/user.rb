class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :nickname,           presence: true
         validates :email,              presence: true
         validates :encrypted_password, presence: true   
         validates :birth_day,          presence: true  
         validates :lastname,           presence: true  
         validates :firstname,          presence: true  
         validates :lastname_kana,      presence: true  
         validates :firstname_kana,     presence: true


end
