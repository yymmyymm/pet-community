class Public::HomesController < ApplicationController


  def top
    @post_images = PostImage.all
    @post_image = PostImage.order("RANDOM()").limit(1)
    @customers = Customer.all
    @genres = Genre.all
    @tag_list=Tag.all
    @questions = Question.all
  end

  def about
  end
end
