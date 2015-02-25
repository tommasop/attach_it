AttachIt::Engine.routes.draw do
  root :to => "attached_files#index"

  resources :attached_files
end
