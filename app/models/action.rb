class Action < ApplicationRecord
    belongs_to :user
    belongs_to :course

    validates :step, presence: true
    validates :description, presence: true
    validates :category, presence: true
end
