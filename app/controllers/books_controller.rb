class BooksController < ApplicationController

  def new
    @book = Book.new
    @book.build_genre
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render new_book_path
    end
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :genre_id, genre_attributes: [:name])
  end
end
