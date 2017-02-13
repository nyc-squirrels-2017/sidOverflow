class AnswersController < ApplicationController

  def create
    @question = Question.find_by_id(params[:question_id])
    @answer = @question.answers.new(answer: answer_params[:answer], user: current_user)

    if @answer.save
      redirect_to @question
    else
      render "questions/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:answer)
  end
end
