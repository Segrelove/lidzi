class DashboardsController < ApplicationController
  before_action :authenticate_user, only: [:index, :show, :destroy] 

  def index
    @leads = Lead.all
  end

  def show
    @lead = Lead.find(params[:id])
  end

  def destroy
    @lead = Lead.find(params[:id])
    if @lead.destroy 
      flash[:primary] = "Ton gossip a bien été supprimé."
      redirect_to dashboard_path
      return
    else
    end
  end

  private 

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
