class Public::HomesController < ApplicationController

  def top
    @post_images = PostImage.all
    @post_image_rand = PostImage.order("RANDOM()").limit(1)
    @customers = Customer.all
    @genres = Genre.all
    @post_detail = PostImage.find_by(params[:id])
    unless ViewCount.find_by(customer_id: current_customer.id, post_image_id: @post_detail.id)
      current_customer.view_counts.create(post_image_id: @post_detail.id)
    end
  end

  def about
  end
end
