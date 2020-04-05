class GoalsController < ApplicationController
  def show
    @goal = Goals::ViewModels::Goal.find(params[:id])
  end

  def index
    @goals = Goals::ViewModels::Goal.all
  end

  def new
    @goal_id = SecureRandom.uuid
  end

  def create
    goal_repository.with_goal(params[:goal_id]) { |goal| goal.add }
    redirect_to root_path
  end

  def activate
    goal_repository.with_goal(params[:goal_id]) { |goal| goal.activate }
    redirect_to root_path
  end

  def add_money
    goal_repository.with_goal(params[:goal_id]) { |goal| goal.add_money(params[:amount]) }
    redirect_to root_path
  end

  private

  def goal_repository
    Goals::GoalRepository.new
  end
end