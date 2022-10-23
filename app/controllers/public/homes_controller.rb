class Public::HomesController < ApplicationController


  def top
    @post_images = PostImage.all
    if @post_images != nil
      @post_image = @post_images[SecureRandom.random_number(PostImage.all.count())]
    end
    @customers = Customer.all
    @genres = Genre.all
    @tag_list=Tag.all
    @questions = Question.all
  end

  def about
  end

end
