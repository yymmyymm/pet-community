class Public::QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.customer_id = current_customer.id
    @question.save
    redirect_to questions_path
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @question_comment = QuestionComment.new
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:q_title, :q_image, :q_caption)
  end
end
