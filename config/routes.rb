Rails.application.routes.draw do
  # topアクションを呼び起こす
  get '/top' => 'homes#top'
  # 最初のアクセス時にtopアクションを呼び起こす
  root :to => 'homes#top'
 
  # resourcesでアクションをまとめて作成。必要あるものだけonlyで作成
  resources :books, only:[ :index, :show, :edit, :create, :delete, :update]
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
 
  
end
