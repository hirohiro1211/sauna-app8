class PlansController < ApplicationController
  def create
    @plan = Plan.new(plan_params)
     if @plan.save 
     redirect_to root_path
     else
     render "saunas/show"
     end
   end
 
   private
   def plan_params
     params.require(:plan).permit(:date, :time_plan_id).merge(user_id: current_user.id, sauna_id: params[:sauna_id])
   end
 
end
