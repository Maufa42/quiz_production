class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @quizes = current_user.quizzes
  end
end
