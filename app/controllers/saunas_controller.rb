class SaunasController < ApplicationController
  def index
    @saunas = Sauna.all
    if user_signed_in?
    @plans = Plan.where(" date > ?",Date.today).where(user_id: current_user.id).order(date: "ASC")
    end
    if admin_signed_in?
    @plans = Plan.where(" date > ?",Date.today).count
    end
  end
  
  def new
    @sauna = Sauna.new
  end

  def create
    @sauna = Sauna.new(sauna_params)
    if @sauna.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @sauna = Sauna.find(params[:id])
    @plan = Plan.new
    @plans = @sauna.plans.includes(:user)
  end
  
  def edit
    @sauna = Sauna.find(params[:id])
    unless admin_signed_in? && current_admin.id == @sauna.admin_id
     redirect_to action: :index
    end
  end


  def update
    sauna = Sauna.find(params[:id])
    sauna.update(sauna_params)
    if sauna.update(sauna_params)
      redirect_to sauna_path(sauna.id),method: :get
    else
      render :edit
    end
  end

  def destroy
    sauna = Sauna.find(params[:id])
    sauna.destroy
    redirect_to root_path
  end

  private
  def sauna_params
    params.require(:sauna).permit(:name, :sauna_deg, :water_deg, :price, :time_limit, :address, :business_hours, :image).merge(admin_id: current_admin.id)
  end
end

