class ReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index 
    # incorporate search bar for reviews
    # if params[:book]
    #   book = Book.find_by(title: params[:book][:category_name]).id
    # end

    # check if nested route has params[:book_id] and if the book exists
    if params[:book_id] && @book = Book.find_by(id: params[:book_id])

      @reviews = Review.ordered_reviews_for_a_book(@book)
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

  def edit
    @review = Review.find_by(id: params[:id])

    if @review.nil? || !edit_permission?(@review)
      flash[:alert] = "You can only edit reviews that exist and were created by you"
      redirect_to user_path(current_user)
    end

  end

  def update
    @review = Review.find_by(id: params[:id])

    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render :edit
    end 
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :book_id)
  end

  def edit_permission?(review)
    review.user == current_user
  end

end
