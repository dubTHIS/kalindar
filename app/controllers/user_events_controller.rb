class UserEventsController < ApplicationController
  def new

  end
  
  def add
  	@event = Event.find(params[:event])
  	@user = current_user
  	@user_event = UserEvent.new()
  	@user_event.user_id = @user.id
  	#@user_event.event_id = @event.id
  	@event.user_events << @user_event
  	@user.user_events << @user_event
  	if @user_event.save
      track_activity @event
    	respond_to do |format|
    		format.html { redirect_to root_url, notice: 'Successfully added event.'}
    		format.json
  	  end
    else 
      respond_to do |format|
        format.html { redirect_to root_url, notice: 'Error, could not add the event.'}
        format.json
      end
    end
  end

  def remove
    @event = Event.find(params[:event])
    @user = current_user

    if @user
      @course = @event.course
      @user.events.delete(@event)
      redirect_to course, notice: 'Event Removed.'
    end
  end
end