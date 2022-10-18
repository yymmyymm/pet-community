class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @model = params[:model]
    @content = params[:content]
    if @model == "customer"
      @records = Customer.search_for(@content).page(params[:page])
    elsif @model == "post_image"
      @records = PostImage.search_for(@content).page(params[:page])
    else
      @records = Question.search_for(@content).page(params[:page])
    end
  end
end
