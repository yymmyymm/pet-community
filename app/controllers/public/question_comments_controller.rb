class Public::QuestionCommentsController < ApplicationController

   def create
    question = Question.find(params[:question_id])
    q_comment = current_customer.question_comments.new(question_comment_params)
    q_comment.question_id = question.id
    q_comment.save
    redirect_to question_path(question)
  end

  def destroy
    QuestionComment.find(params[:id]).destroy
    redirect_to question_path(params[:question_id])
  end

  private

  def question_comment_params
    params.require(:question_comment).permit(:q_comment)
  end
end
