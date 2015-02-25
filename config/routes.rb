AttachIt::Engine.routes.draw do
  root :to => "attached_files#index"

  resources :attached_files do
    member do
      get 'download'
    end
  end
end
