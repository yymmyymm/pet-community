class Public::QuestionCommentsController < ApplicationController

  def create
    question = Question.find(params[:question_id])
    comment = current_customer.question_comments.new(question_comment_params)
    comment.question_id = question.id
    comment.save
    redirect_to question_path(question)
  end

  def destroy
    QuestionComment.find(params[:id]).destroy
    redirect_to question_path(params[:question_id])
  end

  private

  def question_comment_params
    params.require(:question_comment).permit(:comment)
  end
end
