class Public::GenresController < ApplicationController

  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @genre_post_images = PostImage.where(genre_id: @genre.id).page(params[:page])
  end
end
