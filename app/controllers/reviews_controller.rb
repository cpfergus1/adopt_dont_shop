class ReviewsController < ApplicationController
  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:id])
    @user = User.find_by(name: params[:review][:user_name])
    # review = @user.reviews.create(review_params)
    @review = @user.reviews.create(review_params.merge(pic: params[:review][:pic]))
    redirect_to "/shelters/#{@shelter.id}"
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
    params.require(:review).permit(:title, :rating, :shelter_id, :content, :user_name, :user_)
  end


end
