class User < ApplicationRecord
    has_many :meals
    has_many :recipes, through: :meals
    #has_many :reviews

    has_secure_password

    validates :first_name, :last_name, :user_name, presence: true
    validates :user_name, uniqueness: true
    validates :password, length: {minimum: 6}
end
