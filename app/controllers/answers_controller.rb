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

  def edit
    @answer = Answer.find_by_id(params[:id])
  end

  def update
    @answer = Answer.find_by_id(params[:id])

    if authorized?(@answer.user_id) && @answer.update(answer_params)
      @question = Question.find_by_id(@answer.question_id)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @answer = Answer.find_by_id(params[:id])
    @question = Question.find_by_id(@answer.question_id)

    if authorized?(@answer.user_id)
      @answer.destroy
      redirect_to @question
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:answer)
  end
end
