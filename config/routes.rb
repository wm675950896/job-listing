Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :jobs do
    resources :resumes
  end

  namespace :admin do
    resources :jobs do
      member do
        post :appear
        post :disappear
      end
      resources :resumes
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
