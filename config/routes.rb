Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'application#jaysonpresto'
   post '/send-message-by-visitor/', to: 'application#send_message_by_visitor', as: :send_message_by_visitor
   get '/ncov19-tracker/', to: 'virus#corona', as: :ncov
   resources :programming_notes, path: 'programming-notes'
   namespace :projects do
    resources :raffles, path: 'raffle-draw' do
      collection do
        get :search_winner
      end
    end
    resources :participants do
      member do
        post :set_to_special
        post :unset_to_special
        post :move_to_top
        post :move_up
        post :move_down
        post :move_to_bottom
        post :set_as_grand_winner
        post :set_as_second_grand_winner
        post :deactivate_grand_winner
        post :deactivate_second_grand_winner
      end
      collection do
        get :s
        get :import_participants
        post :import_participants
        post :reset
      end
    end
   end
end
