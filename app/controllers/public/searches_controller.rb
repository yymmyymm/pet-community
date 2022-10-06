class Public::SearchesController < ApplicationController


  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == "customer"
      @records = Customer.search_for(@content, @method).page(params[:page])
    else
      @records = PostImage.search_for(@content, @method).page(params[:page])
    end
  end
end
