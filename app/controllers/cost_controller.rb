class CostController < ApplicationController
  protect_from_forgery with: :null_session
<<<<<<< HEAD
# comit conflict branch
=======
# branch commit conflict
>>>>>>> testConflict
  def index
    if params[:cost]
      convert = TextConvert.new
      @answer = convert.rublej(params[:cost].to_i)
      render plain: @answer
    else
      @answer = "Введите сумму платежа в рублях"
    end
  end

end

