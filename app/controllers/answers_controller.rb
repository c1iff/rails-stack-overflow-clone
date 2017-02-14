class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:notice] = "Answer added"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Please try again"
      redirect_to :back
    end
  end
  def update
  end
  def destroy
  end
private
  def answer_params
    params.require(:answer).permit(:content, :question_id, :user_id)
  end
end
