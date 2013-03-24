Rails.application.routes.draw do
  resources :ruby_analyzer, only: [:index] do
    collection do
      get :duplications
      get :complexity
      get :unused
    end
  end
end