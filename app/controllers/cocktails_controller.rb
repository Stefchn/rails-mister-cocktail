class CocktailsController < ApplicationController
   def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render 'new'
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  # before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  # def index
  #   @cocktails = Cocktail.all
  # end

  # def show
  # end

  # def new
  #   @cocktail = Cocktail.new
  # end

  # def edit
  # end

  # def create
  #   @cocktail = Cocktail.new(cocktail_params)
  #   if @cocktail.save
  #     redirect_to cocktails_path
  #   else
  #     render :new
  #   end
  # end

  # def update
  #   if @cocktail.update(cocktail_params)
  #     redirect_to cocktails_path
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @cocktail.destroy
  #   redirect_to cocktails_path
  # end

  # private

  # def set_cocktail
  #   @cocktail = Cocktail.find(params[:id])
  # end

  # def cocktail_params
  #   params.require(:cocktail).permit(:name, :photo_cache)
  # end
end
