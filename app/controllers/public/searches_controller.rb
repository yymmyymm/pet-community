class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @model = params[:model]
    @content = params[:content]
    if @model == "customer"
      @records = Customer.search_for(@content).page(params[:page])
    else
      @records = PostImage.search_for(@content).page(params[:page])
    end
  end
end
