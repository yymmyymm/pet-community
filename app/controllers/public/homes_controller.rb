class Public::HomesController < ApplicationController

  def top
    @post_images = PostImage.all
    @post_image_rand = PostImage.order("RANDOM()").limit(1)
    @customer = Customer.find_by(params[:id])
    @customers = Customer.all
    @genres = Genre.all

  end

  def about
  end
end
