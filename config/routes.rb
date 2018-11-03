Rails.application.routes.draw do
  get '/animes', to: 'v1/animes#index'
end
