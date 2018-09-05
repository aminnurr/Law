class CasesController < ApplicationController
  before_action :set_case, only: [:show, :update, :edit]

  def index
    @case = Case.paginate(:page => params[:page])
  end

  def show
    @related_cases = Case.where.not(id: @case.id).order("RANDOM()").limit(3)
  end

  def edit
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
      @case = Case.friendly.find(params[:id])
      # .find(params[:id])
    end


    def case_params
      params.require(:case).permit(:title, :content)
    end
end
