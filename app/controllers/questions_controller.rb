class QuestionsController < ApplicationController
  before_filter :authorize, only: [:edit, :update, :destroy]

  def upvote
    @question = Question.find(params[:id])
    @question.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @question = Question.find(params[:id])
    @question.downvote_by current_user
    redirect_to :back
  end

  def index
    @questions = Question.all.order('created_at')
  end
  def show
    @question = Question.find(params[:id])
    @answers_un = @question.answers

    @answers = @answers_un.sort{ |a, b| b.get_upvotes.size <=> a.get_upvotes.size}
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
  def edit
    @question = Question.find(params[:id])

  end
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Update Successful"
      redirect_to questions_path
    else
      flash[:alert] = "Update Failed"
      redirect_to :back
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.answers.each do |answer|
      answer.destroy
    end
    @question.destroy
    redirect_to questions_path
  end
  private
    def question_params
      params.require(:question).permit(:content, :user_id)
    end
end
