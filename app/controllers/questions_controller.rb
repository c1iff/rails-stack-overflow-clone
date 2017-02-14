class QuestionsController < ApplicationController
  def up_vote
    @question = Question.find(params[:format])
    @question.up_vote

    render :show
  end

  def index
    @questions = Question.all
  end
  def show
    @question = Question.find(params[:id])
  end
  def new
    @question = Question.new
  end
  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question added"
      redirect_to questions_path
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
    def question_params
      params.require(:question).permit(:content, :user_id)
    end
end
