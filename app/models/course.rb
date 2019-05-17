class Course < ApplicationRecord
#Associations
    has_many :actions
    has_many :users, through: :actions
#Validations
    validates :title, presence: true
    validates :category, presence: true
    validates :description, presence: true
#Scoping
    scope :highest_rated, -> { where("course_rating > 4") }
end
