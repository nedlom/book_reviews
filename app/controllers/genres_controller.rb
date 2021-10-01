class GenresController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @genres = Genre.alpha
  end

  def show
    @genre = Genre.find_by(id: params[:id])
  end

end
