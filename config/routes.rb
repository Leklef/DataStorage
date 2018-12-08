Rails.application.routes.draw do

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"
  get "/update_db", to: "animes#fill_db"
  scope module: 'v1' do
    resources :animes, only: [:index, :show]
  end

end
