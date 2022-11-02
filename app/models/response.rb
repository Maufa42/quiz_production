class Response < ApplicationRecord
  belongs_to :quizze
  belongs_to :user


  def calculate
    self
    debugger
  end

end
