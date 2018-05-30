Rails.application.routes.draw do
  get 'license/index'
  root 'onestrokes#index'
  get 'hoge/index'
  get 'onestrokes/index'
  get 'onestrokes/show'
  get 'license' => 'license#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
