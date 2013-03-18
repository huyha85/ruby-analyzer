Rails.application.routes.draw do
  resources :ruby_analyzer, only: [:index] do
    collection do
      match :preview
    end
  end
end