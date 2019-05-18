class Step < ApplicationRecord
#Associations
    belongs_to :user
    belongs_to :course
#Validations
    validates :step, presence: true
    validates :description, presence: true
    validates :category, presence: true
#Scoping
    # breathing, thinking, writing, reading 
    scope :breathing, -> {where(category: 'breathing')}
    scope :thinking, -> {where(category: 'thinking')}
    scope :writing, -> {where(category: 'writing')}
    scope :reading, -> {where(category: 'reading')}
end
