class SearchsController < ApplicationController
  def show
  	@search = Search.find(params[:id])
  	@cases = Case.where(title: @search.keyword).order("created_at DESC")
  end

  def create

  	@search = Search.new(set_params)

  	if @search.save
  		render :show
  	end

  end

  private

  	def set_params
  		params.require(:search).permit(:keyword)
  	end

end
