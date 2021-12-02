module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, [Types::UserType], null: false

    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, Int, 'id', required: false
    end

    def user(id:)
      User.find(id)
    end

    field :teachers, [Types::TeacherType], null: false

    def teachers
      Teacher.all
    end

    field :teacher, Types::TeacherType, null: false do
      argument :id, Int, 'id', required: false
    end

    def teacher(id:)
      Teacher.find(id)
    end

    field :subjects, [Types::SubjectType]

    def subjects
      Subject.all
    end

    field :subject, Types::SubjectType do
      argument :id, Int, 'id', required: false
    end

    def subject(id:)
      Subject.find(id)
    end

    field :subject_search, resolver: Resolvers::SubjectSearchResolver

    field :lectures, [Types::LectureType]

    def lectures
      Lecture.all
    end

    field :lecture, Types::LectureType do
      argument :id, Int, 'id', required: false
    end

    def lecture(id:)
      Lecture.find(id)
    end
  end
end
