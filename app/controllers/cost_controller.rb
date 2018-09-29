class CostController < ApplicationController
  def index
    @answer = get_answer
  end

  def get_answer
    return "123"
  end
end

