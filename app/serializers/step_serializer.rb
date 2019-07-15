class StepSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :course_id, :name, :description, :time, :category

  belongs_to :course
end
