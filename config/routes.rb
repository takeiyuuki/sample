Rails.application.routes.draw do
  # get 'stocks/index'

# get 'blogs/index'
  get '/blogs', to: 'blogs#index' #追記する
  # get '/contacts', to: 'contacts#new'

  # get '/stocks', to: 'stocks#index' #追記する
  # get '/contacts' to: 'contacts#index' #????????????
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blogs do #これを入力するとルートの一覧が作成される。
    collection do
      post :confirm
    end
  end
  resources :contacts do#これでcontactsのルートを追加できた
  end
end
