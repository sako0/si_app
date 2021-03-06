module Types
  class LectureType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :date, GraphQL::Types::ISO8601Date, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
