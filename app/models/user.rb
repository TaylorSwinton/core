class User < ApplicationRecord
    has_many :actions
    has_many :courses, through: :actions

    validates :name, presence: true
    validates :password_digest, presence: true
    validates :email, uniqueness: true
end
