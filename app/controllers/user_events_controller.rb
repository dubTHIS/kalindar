class UserEventsController < ApplicationController
  def new
  	@event = Event.find(params[:event])
  	@user = current_user
  	@user_event = UserEvent.new()
  	@user_event.user_id = @user.id
  	#@user_event.event_id = @event.id
  	@event.user_events << @user_event
  	@user.user_events << @user_event
  	@user_event.save

  	respond_to do |format|
  		format.html { redirect_to root_url, notice: 'Successfully added event.'}
  		format.json
	  end
  end

  def create
  	@event = Event.find(params[:event])
    @user = current_user
    @user_event = UserEvent.new()
    @user_event.user_id = @user.id
    @user_event.event_id = @event.id
    @course.user_events << @user_event
    @user.user_events << @user_event
    @user_event.save

    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Successfully added event.'}
      format.json
    end
  end

  def remove
    event = Event.find(params[:event])
    user = @event.users.find(current_user)

    if user
      event.users.delete(user)
      redirect_to courses_path, notice: 'Event Removed.'
    end
  end
end