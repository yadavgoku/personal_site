class SessionsController < ApplicationController
  def new
    @session = User.new
  end
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to '/signup'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def session_params
    params.require(:session).permit( :email, :password)
  end
end