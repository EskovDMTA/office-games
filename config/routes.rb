Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }, controllers:
    {
      sessions: "users/sessions",
      registrations: "users/registrations"
    }
  get "users/current_user", to: "users/current_user#show"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "homes#home"

  namespace "api", defaults: { format: :json } do
    namespace "v1" do
      resources :game_types
      resources :games

      scope module: 'organizations' do
        resources :organizations do
          resources :teams , only: %i[index]
        end
      end

      resources :teams, only: %i[show create update destroy]
    end
  end
end

