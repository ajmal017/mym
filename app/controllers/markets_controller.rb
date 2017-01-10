class MarketsController < ApplicationController

	def index
		@markets = Market.all
	end

	def show
		@market = Market.find(params[:id])
	end

	def new
		@market = Market.new
	end

	def edit
		@market = Market.find(params[:id])
		@marketTypes = MarketType.all
	end
	
	def update
		@market = Market.find(params[:id])
	    if @market.update(market_params)
	      flash[:success] = "You have sucessfully updated this market"  
	      redirect_to market_path(@market)
	    else
	      render :edit
	    end
	end
	
	private
	
	def market_params
		  params.require(:market).permit(:name, :description, :market_type_id)	
	end

end
