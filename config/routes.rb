Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products

  resource :cart, only: [:show, :destroy] do
    # collection do
    #   post :add, path: 'add/:id'
    # end
    post :delete_item, path: 'delete/:id', on: :collection
    post :change_num, path: 'change/:id/:symbol', on: :collection 
    post :add, path: 'add/:id', on: :collection
    get :payment, on: :collection
    post :pay
  end

  root 'products#index'
end
