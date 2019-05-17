class Course < ApplicationRecord
    has_many :actions
    has_many :users, through: :actions

    validates :title, presence: true
    validates :category, presence: true
    validates :description, presence: true
end
