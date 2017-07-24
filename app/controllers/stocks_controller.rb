class StocksController < ApplicationController

  def search
    if params[:stock]
      @stock = Stock.find_by_ticker(params[:stock])
      # si la variable stock esta vacia, usa Stock.new_from_lookup para buscar los datos del stock, 
      # en caso contrario no hace nada ya que la encontro anteriormente en la bd
      @stock ||= Stock.new_from_lookup(params[:stock]) 
    end
    if @stock
    #render json: @stock
     render partial: 'lookup'
    else
      render status: :not_found, nothing: true
    end 
  end
  
end