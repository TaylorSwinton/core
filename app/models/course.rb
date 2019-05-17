class Course < ApplicationRecord
    has_many :actions
    has_many :users, through: :actions
end
