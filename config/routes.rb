Rails.application.routes.draw do
  resources :users, except: [:new, :edit] do
    member do
      delete 'soft_delete', to: 'users#destroy'
    end
  end

  resources :events, except: [:new, :edit] do
    collection do
      get 'user/:user_id', to: 'events#user_events', as: 'user_events'
    end
    member do
      delete 'soft_delete', to: 'events#destroy'
    end
  end
end
