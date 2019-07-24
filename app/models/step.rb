class Step < ApplicationRecord
#Associations
    belongs_to :user
    belongs_to :course
#Validations
    validates :name, presence: true
    validates :description, presence: true
    validates :category, presence: true
#Validates Associations
    validates :course_id, presence: true
    validates_associated :course
#Nested Attributes
    #accepts_nested_attributes_for :course
def course_attributes=(attributes)
    course = Course.find_or_create_by(attributes)
    self.course = course if course.valid? || !self.course
end
#Scoping
    # breathing, thinking, writing, reading 
    scope :breathing, -> {where(category: 'breathing')}
    scope :thinking, -> {where(category: 'thinking')}
    scope :writing, -> {where(category: 'writing')}
    scope :reading, -> {where(category: 'reading')}

def next 
    step = Step.where("id > ?", id).first

    if step
        step
    else
        Step.first
    end
end


end
