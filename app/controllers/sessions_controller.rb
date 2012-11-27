class SessionsController < ApplicationController
  def new
  end
  
  # Login API that returns a 204 if valid creds, else a 403 forbidden
  def create
    @user = User.authenticate(params[:email], params[:password])
    
    respond_to do |format|
      if @user
        format.html { redirect_to @user, notice: 'User was successfully logged in.' }
        format.json { render json: @user, :status => 200 }
      else
        flash.now.alert = "Invalid email or password"
        format.html { render action: "new" }
        format.json { render :json => "Authentication Failed.", :status => 403 }
      end
    end
    
  end
end
