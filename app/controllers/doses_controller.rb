class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  # before_action :set_cocktail

  # def new
  #   @dose = Dose.new
  # end

  # def create
  #   @dose = Dose.new(cocktail_params)
  #   @dose.cocktail = @cocktail

  #   if @dose.save
  #     redirect_to cocktail_path(@cocktail.id)
  #   else
  #     render :new
  #   end
  # end

  # private

  # def set_cocktail
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  # end

  # def cocktail_params
  #   params.require(:dose).permit(:description)
  # end
end
