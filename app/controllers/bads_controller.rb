class BadsController < ApplicationController
  def create
    @result = Result.find(params[:result_id])
    @bad = Bad.new(bad_params)
    @bad.result = @result

    if @bad.save
      redirect_to edit_result_path(@result)
    end
  end

  private

  def bad_params
    params.require(:bad).permit(
    :name
    )
  end
end
