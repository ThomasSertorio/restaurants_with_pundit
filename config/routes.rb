Rails.application.routes.draw do
  devise_for :users
  scope '(:locale)', locale: /fr|es|cn/ do
    # -> params[:locale]: "fr"
    root to: 'pages#home'
    resources :restaurants

    # [...]
  end


end

