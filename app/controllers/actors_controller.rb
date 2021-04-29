class ActorsController < ApplicationController

  def index
    #no recuerdo el orden aca
    @actors = Actor.left_joins(:events).group(:id).order('COUNT(events.id) DESC').order('events.created_at DESC').order('login DESC')
    render json: @actors
  end

  def update
    begin
      @actor = Actor.find(actor_params[:id])
    rescue
      return render json: {}, status: 400
    end

    if @actor.update_attributes(actor_params)
      render json: @actor, status: 200
    else
      render json: {}, status: 400
    end
  end

  private

  def actor_params
      params.permit(:id, :avatar_url)
  end
  
end