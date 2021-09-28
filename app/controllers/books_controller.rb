class BooksController < ApplicationController

  def new
    @book = Book.new
    @book.build_genre
  end

  def create
    binding.pry
    book = Book.create(book_params)
    redirect_to book_path(book) 
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :genre_id)
  end
end
