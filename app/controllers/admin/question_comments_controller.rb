class Admin::QuestionCommentsController < ApplicationController

  def destroy
    QuestionComment.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def question_comment_params
    params.require(:question_comment).permit(:comment)
  end
end
