class ReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index 
    # check if nested route has params[:book_id] and if the book exists
    if params[:book_id] && @book = Book.find_by(id: params[:book_id])
      @reviews = @book.reviews
    else
      @reviews = Review.newest
    end
  end

  def new
    # checking for nested route
    @book = Book.find_by(id: params[:book_id])
    if !@book.nil?
      @review = @book.reviews.build
    else
      @review = Review.new
    end
  end

  def create
    @review = current_user.reviews.build(review_params)
    
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
    @review = Review.find_by(id: params[:id])

    if @review.nil?
      redirect_to reviews_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :book_id)
  end

end
