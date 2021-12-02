module Mutations
  class CreateUser < BaseMutation
    field :user, Types::UserType, null: true

    argument :name, String, required: true
    argument :grade, Integer, required: true

    def resolve(**args)
      user = User.create!(args)
      {
        user: user
      }
    end
  end
end
