class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
    @post_images = @customer.post_images.page(params[:page])
  end

  def index
    @customers = Customer.all
    @post_image = PostImage.find_by(params[:id])
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customer_path(current_customer.id)
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image)
  end
end
