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

    def action_attributes=(attributes)
        action = Action.find_or_create_by(attributes)
        self.action = action if action.valid? || !self.action
    end
end
