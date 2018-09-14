class SessionsController < ApplicationController

  def new
    render :login
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
      login!(@user)
      redirect_to bands_url
    else
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
