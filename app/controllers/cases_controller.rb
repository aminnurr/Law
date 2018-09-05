class CasesController < ApplicationController
  before_action :set_case, only: [:show, :update]

  def index
    @case = Case.all
  end

  def show
    @related_cases = Case.where.not(id: @case.id).order("RANDOM()").limit(3)
  end

  def edit
    @case = Case.find(params[:id])
  end


  def update
    respond_to do |format|
      if @case.update(case_params)
        format.html { redirect_to @case, notice: 'Case was successfully updated.' }
        format.json { render :show, status: :ok, location: @case }
      else
        format.html { render :edit }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  

  private

    def set_case
      @case = Case.find(params[:id])
    end


    def case_params
      params.require(:case).permit(:title, :content)
    end
end
