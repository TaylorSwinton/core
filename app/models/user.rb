class User < ApplicationRecord
    has_many :actions
    has_many :courses, through: :actions
end
