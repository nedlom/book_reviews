class BooksController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @book.build_genre
  end

  def create
  
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book)
    else
      # need this to render address field
      @book.build_genre
      render new_book_path
    end
  end

  def show
    @book = Book.find_by(id: params[:id])

    if @book.nil?
      redirect_to books_path
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])
  end

  def update
    binding.pry
    @book = Book.find_by(id: params[:id])

    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end 
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :genre_id, genre_attributes: [:name])
  end
end
