# frozen_string_literal: true
Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :subjects, only: [:index]
    end
  end
end

