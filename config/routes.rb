Rails.application.routes.draw do
  devise_for :users
  get 'ps3/index'
  root 'topics#index'
  get 'ps2/index'
  get 'ps2/quotations', :as => 'quote'
  get 'ps1/index'
  get 'ps1/news'
  get 'ps1/divide'
  get '/ps2_db', :to => redirect('/ps2_db')
  root 'topics#index'
  get 'ps2/export_to_json', as:'export_to_json'
  get 'ps2/export_to_xml', as:'export_to_xml'
  post 'ps2/quotations'
  #get 'ps2/search', to: 'ps2#search'
  get '/search' => 'ps2#search', :as => 'search_page'
  get '/ps2/:id/kill(.:format)' => 'ps2#kill', :as => 'killed'
  get 'ps2/del'
  post 'ps2/import' => 'ps2#import'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
