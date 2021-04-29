class EventsController < ApplicationController
  before_action :set_event, only: %i[ show update destroy ]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    render json: @events
  end

  # GET /events/1
  # GET /events/1.json
  def show
    render json: @event, status: 200
  end

  # DELETE /erase
  def erase
    Event.delete_all
    Actor.delete_all
    Repo.delete_all
    render json: {},  status: 200
  end

  # POST /events
  # POST /events.json
  def create
    event_exists = Event.find_by_id(params[:id])

    return render json: {}, status: 400 if event_exists

    actor = params[:actor]
    repo = params[:repo]

    @event = Event.new
    @event.id = params[:id]
    @event.event_type = params[:event]
    @event.created_at = params[:created_at]
    @event.actor      = Actor.find_or_create_by(id: actor[:id], login: actor[:login], avatar_url: actor[:avatar_url])
    @event.repo       = Repo.find_or_create_by(id: repo[:id], name: repo[:name], url: repo[:url])

     if @event.save
       render json: @event, status: :created
     else
       render json: @event.errors, status: :unprocessable_entity
     end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    if @event.update(event_params)
      render :show, status: :ok, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
       params.require(:event).permit(:type, :actor_id, :repo_id)
      # params.(:event).permit(:id, :type, actor: {:id, :login, :avatar_url}, repo: {:id, :name, :url})
    end
end
