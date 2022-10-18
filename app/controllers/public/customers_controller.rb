class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
    @post_images = @customer.post_images.page(params[:page]).order(created_at: :desc)
  end

  def index
    @customers = Customer.where(is_deleted: false)
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

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
  reset_session
    flash[:notice] = "ありがとうございました。またのご利用をお待ちしております"
    redirect_to root_path
  end

  def unsubscribe
  end

  def favorites
    @customer = Customer.find(params[:id])
    favorites = Favorite.where(customer_id: @customer.id).pluck(:post_image_id)
    @favorites = PostImage.find(favorites)
  end

  def question_favorites
    @customer = Customer.find(params[:id])
    question_favorites = QuestionFavorite.where(customer_id: @customer.id).pluck(:question_id)
    @question_favorites = Question.find(question_favorites)
  end

  private

  def customer_params
    params.require(:customer).permit(:name,:name_kana,:email,:pen_name,:pet_name,:introduce,:profile_image,:is_deleted)
  end
end
