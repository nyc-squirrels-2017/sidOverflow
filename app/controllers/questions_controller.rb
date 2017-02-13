class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def show
    @question = Question.find_by(id: params[:id])
  end

  def edit
    @question = Question.find_by(id: params[:id])
  end

  def update
    @question = Question.find_by(id: params[:id])

    if authorized?(@question.user_id) && @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :question)
  end

end
