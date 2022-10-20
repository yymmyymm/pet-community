class Admin::QuestionsController < ApplicationController
before_action :authenticate_admin!

  def index
    @questions = Question.page(params[:page]).order(created_at: :desc)
  end

  def show
    @questions = Question.page(params[:page])
    @question = Question.find(params[:id])
    @question_comment = QuestionComment.all
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to admin_path
  end

  def question_params
    params.require(:question).permit(:title, :q_image, :caption)
  end
end