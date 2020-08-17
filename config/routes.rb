Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'application#jaysonpresto'
   post '/send-message-by-visitor/', to: 'application#send_message_by_visitor', as: :send_message_by_visitor
   get '/ncov19-tracker/', to: 'virus#corona', as: :ncov
end
