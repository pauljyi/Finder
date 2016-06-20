class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @events = Event.all
    @all_attendances = Attendance.all

# This shows who you are following
    if current_user.id == @user.id
      @followings = Following.where(:user_id => current_user.id)
      @followed = []
      @followings.each do |following|
        @followed << following.followed_id
      end
      @my_followeds = User.where(:id => @followed)

# This gives the events being attended by the people you are following
      @followed_attendances = Attendance.where(:user_id => @followed)
      @followed_events = []
      @followed_attendances.each do |followed_attending|
        @followed_events << followed_attending.event_id
      end
      @my_followed_events = Event.where(:id => @followed_events)
    end

# This shows what events you are going to
    if current_user.id == @user.id
      @attendances = Attendance.where(:user_id => current_user.id)
      @attended = []
      @attendances.each do |attendance|
        @attended << attendance.event_id
      end
      @my_events = Event.where(:id => @attended)
    end
  end


  def follow
    @user = User.find(params[:id])
    @followings = Following.where(:user_id => current_user.id)


    if Following.where(:user_id => current_user.id, :followed_id => @user.id).blank?
      @user = User.find(params[:id])

      @following = Following.new
      @following.followed_id = @user.id
      @following.user_id = current_user.id
      @following.save

      render 'show.html.erb'
    else
      render 'show.html.erb'
    end
  end

  def unfollow
    @user = User.find(params[:id])
    @following = Following.where(:user_id => current_user.id, :followed_id => @user.id)
    Following.destroy(@following)

    render 'show.html.erb'
  end
end
