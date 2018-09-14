class UsersController < ApplicationController
  def index
    render :index
  end

  def new
    render :new
  end

  def create
    @user = User.new(strong_params)
    if @user.save
      login!(@user)
      redirect_to bands_url
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])

    render :show
  end

private
  def strong_params
    params.require(:user).permit(:email, :password)
  end
end
