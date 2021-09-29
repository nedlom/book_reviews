class ReviewsController < ApplicationController

  def index 
  end

  def new
    @book = Book.find_by(id: params[:book_id])
    if !@book.nil?
      @review = @book.reviews.build
    else
      @review = Review.new
    end
  end

  def create

    binding.pry
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
    @review = Review.find_by(id: params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :book_id)
  end

end
