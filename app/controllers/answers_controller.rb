class AnswersController < ApplicationController
  def new
  end
  def create
  end
  def update
  end
  def destroy
  end
private
  def answer_params
    params.require(:answer).permit(:content, :rating, :user_id)
  end
end
