module Types
  class SubjectType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :weekday, String, null: false
    field :period, Integer, null: false
    field :teacher, TeacherType, null: false
    field :lectures, [LectureType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
