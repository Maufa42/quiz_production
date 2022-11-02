class ResponsesController < ApplicationController
  def index
  end

  def new
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
    hash_arr = []

hash1 = {"1" => params['1'], "2" => params['2'], "3" => params['3']}
hash2 = {"1" => 'fire', "2" => '2', "3" => 'cool'}

hash1.each do |key,value| 
  hash2.each do |k,v|
  if key==k && value==v 
      puts"okay" 
      end 
  end 
end

# hash_arr.push(hash2)
    debugger
  end
end
