class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all
  end

  def show
    @post_comment = PostComment.new
    @customer = Customer.find(params[:id])
    @post_images = @customer.post_images.page(params[:page]).order(created_at: :desc)
    @post_comments = PostComment.all
    @questions = @customer.questions.page(params[:page]).order(created_at: :desc)
  end

  def edit
    @customer = Customer.find(params[:id])
    @post_image = PostImage.find_by(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @post_image = PostImage.find_by(params[:post_image_id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  private

  def customer_params
    params.require(:customer).permit(:name,:name_kana,:email,:pen_name,:pet_name,:post_code,:introduce,:profile_image,:is_deleted)
  end

end
