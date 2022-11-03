class ResponsesController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_response = current_user.responses
  end
  
  def leaderboard
    @leaderboard = Response.all.order('created_at DESC')
  end

  def show
    @responses = Response.find(params[:id])
  end
  
  def create
    @responses = Response.new
    @responses.user_id = current_user.id
    @responses.quizze_id = params[:quizze_id]
    @responses.score = calculate_score(params)
    
    if @responses.save
      redirect_to  response_path(@responses)
    else
    end   
  end

  private
  def responses_params
    params.require(:response).permit(:user_id,:quizze_id,:score)
  end

  def calculate_score(params)
    count = 0
    hash2 = {}    
    quiz = Quizze.find(params[:quizze_id])
    question = quiz.questions
    question.each do |q| hash2.merge!(q.id=>q.answer)  end

      hash2.stringify_keys!

hash1 =  params.except(:authenticity_token,:quizze_id,:score,:commit,:controller,:action)

hash1.each do |key,value| 
  hash2.each do |k,v|
      if key==k && value==v 
          count+=1
      end 
  end 
end
return count*5;

  end
end
