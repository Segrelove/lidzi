class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(
      first_name: params[:first_name], 
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      city_id: 1
      )
      if @user.save
        flash[:success] = "Compte créé. Bienvenue #{@user.first_name}!"
        session[:user_id] = @user.id
        redirect_to root_path
        return
      else
        flash[:danger] = "Informations invalides, réessaye."
        render :new
      end
  end

  def show
  end

  def destroy
  end
end
