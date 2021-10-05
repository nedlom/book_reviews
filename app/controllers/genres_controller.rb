class GenresController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @genres = Genre.alpha
  end

  def show
    @genre = Genre.find_by(id: params[:id])

    if @genre.nil?
      redirect_to genres_path
    end
  end

end
