class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :category, :time, :course_rating

  has_many :steps
end

#add in all the fields that you want to serialize
#making it available to json to edit

#1. add attributes (in schema)
#2. include relationships

