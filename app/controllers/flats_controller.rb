class FlatsController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]
  def new
    @flat = Flat.new
  end

  def index
    @flats = Flat.all
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def update
    @flat = Flat.find(params[:id])
    if @flat.update(flat_params)
      redirect_to flats_path
    else
      render :edit
    end
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path
  end

private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

   def find
    @flat = Flat.find(params[:id])
  end


end
