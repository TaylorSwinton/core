class User < ApplicationRecord
    has_secure_password
#Associations
    has_many :steps
    has_many :courses, through: :steps
#Validations
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
end
