Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  get 'saunas/index'
  root to: "saunas#index"
  resources :saunas, only: [:imdex, :new, :create, :show, :edit, :destroy, :update] do
    resources :plans, only: [:create]
    end
end
