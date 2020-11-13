class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(cocktail: @cocktail)
  end

  def create
    console.log(params)
    console.log(dose_params)

    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params, cocktail: @cocktail)

    if @dose.save
      redirect_to cocktail_doses_path
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:dose)
  end
end
