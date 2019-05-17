class User < ApplicationRecord
    has_secure_password
#Associations
    has_many :actions
    has_many :courses, through: :actions
#Validations
    validates :name, presence: true
    validates :email, uniqueness: true
end
