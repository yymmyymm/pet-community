class Admin::PostImagesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @post_images = PostImage.page(params[:page]).order(created_at: :desc)
    @tag_list=Tag.all
    @genres = Genre.all
  end

  def show
    @post_images = PostImage.page(params[:page])
    @post_image = PostImage.find(params[:id])
    @post_comments = PostComment.all
    @post_tags = @post_image.tags
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
