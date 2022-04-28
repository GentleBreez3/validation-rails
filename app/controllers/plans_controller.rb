class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def show
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)

    if @plan.save
      redirect_to @plan
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @plan.update(plan_params)
      redirect_to @plan
    else
      render :edit
    end
  end

  def destroy
    @plan.destroy
      redirect_to root_path
  end

  private
    def plan_params
      params.require(:plan).permit(:name, :content, :start_date, :end_date, :price, :user_id, :available)
    end
end
