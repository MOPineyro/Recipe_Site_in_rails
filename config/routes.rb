Recipes::Application.routes.draw do
  match('tags', {:via => :get, :to => 'tags#index'})
  match('tags/new', {:via => :get, :to => 'tags#new'})
  match('tags/', {:via => :post, :to => 'tags#create'})
  match('tags/:id', {:via => :get, :to => 'tags#show'})
  match('tags/:id/edit', {:via => :get, :to => 'tags#edit'})
  match('tags/:id', {:via => [:put, :patch], :to => 'tags#update'})
  match('tags/:id', {:via => :delete, :to => 'tags#destroy'})

  match('recipes', {:via => :get, :to => 'recipes#index'})
  match('recipes/new', {:via => :get, :to => 'recipes#new'})
  match('recipes/', {:via => :post, :to => 'recipes#create'})
  match('recipes/:id', {:via => :get, :to => 'recipes#show'})
  match('recipes/:id/edit', {:via => :get, :to => 'recipes#edit'})
  match('recipes/:id', {:via => [:put, :patch], :to => 'recipes#update'})
  match('recipes/:id', {:via => :delete, :to => 'recipes#destroy'})
end
