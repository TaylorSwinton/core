class Course < ApplicationRecord
#Associations
    has_many :steps
    has_many :users, through: :steps
#Validations
    validates :title, presence: true
    validates :category, presence: true
    validates :description, presence: true
#Scoping
    #for index courses filter
    scope :journaling, -> {where(category: "Journaling")}
    scope :meditation, -> {where(category: "Meditation")}
    scope :workout, -> {where(category: "Workout")}

    accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: lambda { |attributes| attributes['name', 'description'].blank? }



    # def step_attributes=(attributes)
    #     step = Step.find_or_create_by(attributes)
    #     self.step = step if step.valid? || !self.step
    # end
end
