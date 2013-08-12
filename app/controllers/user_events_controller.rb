class UserEventsController < ApplicationController
  def new

  end
  
  def add
  	@event = Event.find(params[:event])
  	@user = current_user
    t = 0
    notice = ''

    @user.events.each do |uevent|
      if uevent == @event
        t = 1
        break
      end
    end

    if t == 0 
    	@user_event = UserEvent.new()
    	@user_event.user_id = @user.id
    	#@user_event.event_id = @event.id
    	@event.user_events << @user_event
    	@user.user_events << @user_event
    	if @user_event.save
        track_activity @event
        notice = 'Successfully added event.'
      else
        notice = 'Adding the event failed, please try again.'
      end
    else
      notice = 'You are already attending that event'
    end

  	respond_to do |format|
  		format.html { redirect_to root_url, notice: notice}
  		format.json
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