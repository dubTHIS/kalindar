class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = current_user.events.all
    @events_by_date = @events.group_by(&:due_date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @activities = Activity.order("created_at desc")
    @todos = current_user.events.order("due_date desc")
    @today = Date.today
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @course = Course.find(params[:course_id])
    @event = @course.events.create(params[:event])

    redirect_to add_user_events_path(:event => @event.id)
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @course = Course.find(params[:course_id])
    @event = @course.events.create(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to add_user_events_path(:event => @event.id), notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { redirect_to @course, notice: 'Event could not be created.' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
