class GoalsController < ApplicationController
  
  def new
    @goal = Goal.new
    render :new
  end
  
  def create
    debugger
    params[:goal][:private?] = params[:goal][:private?].nil? ? true : false
    params[:goal][:completed?] = params[:goal][:completed?].nil? ? true : false
    params[:goal][:user_id] = current_user.id 
    # byebug
    @goal = Goal.new(goal_params)
    @user = current_user
    # byebug
    if @goal.save! 
      redirect_to user_url(@user)
    else 
      flash[:errors] = @goal.errors.full_messages
      render :new
    end 
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def show
    
  end
  
  def destroy
    
  end
  
  def goal_params 
    params.require(:goal).permit(:title, :details, :private?, :completed?, :user_id)
  end 
end
