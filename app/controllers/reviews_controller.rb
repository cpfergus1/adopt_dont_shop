class ReviewsController < ApplicationController
  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:id])
    if User.where(name: params[:review][:user_name]) == []
      flash[:notice] = "User name was not entered or does not exist."
      render :new
    else
      @user = User.find_by!(name: params[:review][:user_name])
      review = @user.reviews.new(review_params)
      if review.save
        redirect_to "/shelters/#{@shelter.id}"
      else
        flash[:notice] = "Review Not Created: Fields can not be empty."
        render :new
      end
    end
  end

  def edit
    @review = Review.find(params[:id])
    @shelter = @review.shelter
  end

  def update
    @review = Review.find(params[:id])
    @shelter = @review.shelter
    if User.where(name: params[:review][:user_name]) == []
      flash[:notice] = "User name was not entered or does not exist."
      render :edit
    else
      @user = User.find_by(name: params[:review][:user_name])
      @review.update(review_params)
      if @review.save
        redirect_to "/shelters/#{params[:review][:shelter_id]}"
      else
        flash[:notice] = "Review Not Updated: Fields can not be empty."
        render :edit
      end
    end
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
    params.require(:review).permit(:title, :rating, :shelter_id, :content, :user_name, :pic)
  end


end
