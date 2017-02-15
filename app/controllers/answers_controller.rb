class AnswersController < ApplicationController
  before_filter :authorize, only: [:edit, :update, :destroy]

  def upvote
    @answer = Answer.find(params[:id])
    @answer.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @answer = Answer.find(params[:id])
    @answer.downvote_by current_user
    redirect_to :back
  end
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
  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end
  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = "Update Successful"
      redirect_to question_path
    else
      flash[:alert] = "Update Failed"
      redirect_to :back
    end
  end
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to :back
  end
private
  def answer_params
    params.require(:answer).permit(:content, :question_id, :user_id)
  end
end
