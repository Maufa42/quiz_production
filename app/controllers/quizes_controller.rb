class QuizesController < ApplicationController
  before_action :authenticate_user!

  def index
        @quizes = current_user.quizze 
  end

  def edit
  end

  def new
  end

  def show
    @quiz = Quizze.find(params[:id])

  end
end
