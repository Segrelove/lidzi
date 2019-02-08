class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = "Welcome back #{user.first_name}!"
      session[:user_id] = user.id
      redirect_to dashboards_path
    else
      flash[:danger] = "Mauvaise combinaison réessaye !"
      render 'new'
    end
  end

  def destroy
    if session.delete(:user_id)
      flash[:primary] = "Tu as bien été deconnecté. A bientôt !"
      redirect_to root_path
      return
    else
    end
  end

end
