class RatingsController < ApplicationController
  before_filter :check_user_can_rate, :except => :index

  def index
    @ratings = Rating.page(params[:page])
  end

  def new
    @rating = today.ratings.for_user(current_user)
  end

  def create
    @rating = today.ratings.build(
      :user  => current_user,
      :value => params[:value]
    )
    @rating.save
    render :nothing => true
  end

  def update
    @rating = current_user.ratings.find(params[:id])
    @rating.value = params[:value]
    @rating.save
    render :nothing => true
  end

  private

  def check_user_can_rate
    unless rating_allowed?
      redirect_to root_path, :alert => 'Non puoi lasciare un feedback per il pranzo di oggi!'
    end
  end
end
