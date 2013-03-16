class SessionsController < ApplicationController
  
  respond_to :html

  skip_before_filter :authenticate, :only => [:create]
  
  def create
    auth              = request.env["omniauth.auth"]
    user              = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def index
    if current_user
      respond_with tweets
    end
  end

private

  def tweets
    tweets = Twitter.user_timeline(current_user.uid.to_i)
  end
  
  query_method :tweets

end
