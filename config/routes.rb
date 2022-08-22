Rails.application.routes.draw do
  
  get '/', to: 'players#show'
  get '/players', to: 'players#index'
  # get '/playeronepiece/:id', to 'players#pieceshow'



end
