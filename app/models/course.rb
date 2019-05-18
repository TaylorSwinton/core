class Course < ApplicationRecord
#Associations
    has_many :steps
    has_many :users, through: :steps
#Validations
    validates :title, presence: true
    validates :category, presence: true
    validates :description, presence: true
#Scoping
    scope :highest_rated, -> { where("course_rating > 4") }

    accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: lambda { |attributes| attributes['step', 'description'].blank? }

    def step_attributes=(attributes)
        step = Step.find_or_create_by(attributes)
        self.step = step if step.valid? || !self.step
    end
end
