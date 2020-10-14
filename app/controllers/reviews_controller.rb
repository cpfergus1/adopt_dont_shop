class ReviewsController < ApplicationController
  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:id])
    @user = User.find_by(name: params[:review][:user_name])
    require "pry"; binding.pry
    # review = @user.reviews.create(review_params)
    @review = Review.new(review_params.merge(pic: params[:review][:pic], user_id: @user.id))
    if @review.save
      redirect_to "/shelters/#{@shelter.id}"
    else
      flash[:notice] = "Review Not Created: Fields can not be empty."
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @shelter = @review.shelter
  end

  def update
    @user = User.find_by(name: params[:review][:user_name])
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to "/shelters/#{params[:review][:shelter_id]}"
  end

  def destroy
    shelter = params[:shelter_id]
    Review.destroy(params[:id])
    redirect_to "/shelters/#{shelter}"
  end

  private
  def review_params
    # {
    #   title: params[:review][:title],
    #   rating: params[:review][:rating],
    #   pic: params[:review][:pic],
    #   content: params[:review][:content],
    #   user_name: params[:review][:user_name],
    #   shelter_id: params[:review][:shelter_id]
    # }
    params.require(:review).permit(:title, :rating, :shelter_id, :content, :user_name)
  end


end
