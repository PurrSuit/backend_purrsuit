class UserSerializer < ActiveModel::Serializer
  attributes :id,:email,:name,:age,:gender, :experience_points, :points, :level
end
