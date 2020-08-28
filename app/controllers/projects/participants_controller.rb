class Projects::ParticipantsController < ApplicationController
  layout 'raffles'
  before_action :get_participant, only: [
    :edit, :update, :set_to_special, :unset_to_special,
    :set_as_grand_winner, :deactivate_grand_winner, :set_as_second_grand_winner,
    :deactivate_second_grand_winner, 
    :move_to_top, :move_up, :move_down, :move_to_bottom
  ]
  def index
    @participants = RafflesParticipant.waiting.paginate(page: params[:page], per_page: 10)
  end
  def s
    @participants = RafflesParticipant.candidates.order(:position)
  end
  def new
    @participant = RafflesParticipant.new
  end
  def edit;end
  def update
    if @participant.update(participant_params)
      redirect_to request.referrer, notice: "#{@participant.full_name} has been successfully updated."
    else
      redirect_to request.referrer, alert: "Something's wrong updating the participant."
    end
  end
  def create
    @participant = RafflesParticipant.find_or_create_by( full_name: participant_params[:full_name] )
    redirect_to request.referrer, notice: "#{@participant.full_name} has been successfully added."
  end
  def set_to_special
    if RafflesParticipant.where(special: true).size == 10
      redirect_to request.referrer, alert: "Only 10 Participants are Allowed"
    else
      @participant.update_attribute(:special, true)
      redirect_to request.referrer, notice: "#{@participant.full_name} has been moved to S."
    end
  end
  def unset_to_special
    @participant.update_attribute(:special, false)
    redirect_to request.referrer, notice: "#{@participant.full_name} has been removed to S."
  end
  def set_as_grand_winner
    @participant.update_attribute(:grand_winner, true)
    redirect_to request.referrer, notice: "#{@participant.full_name} has been set as GW."
  end
  def set_as_second_grand_winner
    @participant.update_attribute(:second_grand_winner, true)
    redirect_to request.referrer, notice: "#{@participant.full_name} has been set as SGW."
  end
  def deactivate_grand_winner
    @participant.update_attribute(:grand_winner, false)
    redirect_to request.referrer, notice: "#{@participant.full_name} has been deactivated from GW."
  end
  def deactivate_second_grand_winner
    @participant.update_attribute(:second_grand_winner, false)
    redirect_to request.referrer, notice: "#{@participant.full_name} has been deactivated from SGW."
  end
  def import_participants
    if request.post?
      if params[:file].present? && params[:file].original_filename && [".csv"].include?(File.extname(params[:file].original_filename))
        require 'csv'
        csv_text = File.read(params[:file].path)
        csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
        csv.each do |row|
          participant = row.to_hash['Participants']
          rp = RafflesParticipant.find_or_create_by( full_name: participant )
        end
        redirect_to projects_participants_path, notice: "Participants Imported Successfully."
      end
      # render json: params and return
    end    
  end
  def move_to_top
    @participant.move_to_top
    redirect_to request.referrer, notice: "#{@participant.full_name} has been successfully moved to top."
  end
  def move_up
    @participant.move_higher
    redirect_to request.referrer, notice: "#{@participant.full_name} has been successfully moved up."
  end
  def move_down
    @participant.move_lower
    redirect_to request.referrer, notice: "#{@participant.full_name} has been successfully moved down."
  end
  def move_to_bottom
    @participant.move_to_bottom
    redirect_to request.referrer, notice: "#{@participant.full_name} has been successfully moved to bottom."
  end
  protected
  def participant_params
    params.require(:raffles_participant).permit(:full_name)
  end
  def get_participant
    @participant = RafflesParticipant.find params[:id]
  end
end