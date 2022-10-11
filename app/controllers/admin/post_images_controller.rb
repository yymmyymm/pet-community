class Admin::PostImagesController < ApplicationController

  def index
    @post_images = PostImage.page(params[:page])
    @tag_list=Tag.all
    @genres = Genre.all
  end

  def show
    @post_images = PostImage.page(params[:page])
    @post_image = PostImage.find_by(params[:id])

  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to request.referer
  end


  def post_image_params
    params.require(:post_image).permit(:title, :caption, :image, :category, :genre_id)
  end
end
