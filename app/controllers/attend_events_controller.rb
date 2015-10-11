class AttendEventsController < ApplicationController
  before_action :set_attend_event, only: [:show, :edit, :update, :destroy]

  # GET /attend_events
  # GET /attend_events.json
  def index
    @attend_events = AttendEvent.all
  end

  # GET /attend_events/1
  # GET /attend_events/1.json
  def show
  end

  # GET /attend_events/new
  def new
    @attend_event = AttendEvent.new
  end

  # GET /attend_events/1/edit
  def edit
  end

  # POST /attend_events
  # POST /attend_events.json
  def create
    @attend_event = AttendEvent.new(attend_event_params)
    @attend_event.user_id = current_user.id
    @attend_event.event_id = params[:event_id]
    @attend_event.seen = false

    respond_to do |format|
      if @attend_event.save
        format.html { redirect_to events_url, notice: 'Your request has been recorded.' }
      else
        format.html { render :new }
        format.json { render json: @attend_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attend_events/1
  # PATCH/PUT /attend_events/1.json
  def update
    respond_to do |format|
      if @attend_event.update(attend_event_params)
        format.html { redirect_to events_url, notice: 'Hours successfully updated.' }
        format.json { render :show, status: :ok, location: @attend_event }
      else
        format.html { render :edit }
        format.json { render json: @attend_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attend_events/1
  # DELETE /attend_events/1.json
  def destroy
    @attend_event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Request successfully rescinded.' }
      format.json { head :no_content }
    end
  end

  def approve
    @attend_event = AttendEvent.find(params[:id])
    if current_user.id == @attend_event.user.id
      @attend_event.approved = true
      @attend_event.seen = true
      @attend_event.save
      redirect_to events_url, notice: 'Request approved.'
    else
      redirect_to events_url, notice: 'Nice try.'
    end
  end

  def deny
    @attend_event = AttendEvent.find(params[:id])
    if current_user.id == @attend_event.user.id
      @attend_event.approved = false
      @attend_event.seen = true
      @attend_event.save
      redirect_to events_url, notice: 'Request denied.'
    else
      redirect_to events_url, notice: 'Nice try.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attend_event
      @attend_event = AttendEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attend_event_params
      params.require(:attend_event).permit(:hours, :description, :event_id)
    end
end
