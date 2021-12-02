class SubjectsSerializer < ActiveModel::Serializer
  attributes :title, :weekday, :period
  belongs_to :teacher, serializer: TeachersSerializer
  has_many :lectures, serializer: LecturesSerializer
end
