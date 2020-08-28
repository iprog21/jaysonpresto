class Projects::RafflesController < ApplicationController
  http_basic_authenticate_with :name => 'iprog21', :password => 'iprog21'
  layout 'raffles'
  def index; end
  def search_winner
    end_of_draw = false
    winner_message = 'The Raffle Draw Is Done. Thank You!'
    @participants = RafflesParticipant.candidates
    
    if @participants.size == 0
      end_of_draw = true
    else
      winner = @participants.first
      winner.winner = true
      winner.save(validate: false)
      winner_message = "The Lucky Winner is #{winner.full_name}"
    end
  
    render json:  {
      winner: winner_message,
      end_of_draw: end_of_draw
    }
  end
end