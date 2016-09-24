class StocksController < ApplicationController

  def search
    if params[:stock]
      @stock = Stock.find_by_ticker(params[:stock])
      if @stock.blank?
        @stock = Stock.new_from_lookup(params[:stock])
      end
    end

    if @stock
      render partial: 'lookup'
    else
      render status: :not_found, nothing: true
    end
  end
end
