# frozen_string_literal: true
Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
  # namespace :api, { format: 'json' } do
  #   namespace :v1 do
  #     resources :subjects, only: [:index]
  #   end
  # end
end

