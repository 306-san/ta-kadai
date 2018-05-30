Rails.application.routes.draw do
  root 'onestrokes#index'
  get 'hoge/index'
  get 'onestrokes/index'
  get 'onestrokes/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
