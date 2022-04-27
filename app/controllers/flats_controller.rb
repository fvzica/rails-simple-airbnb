class FlatsController < ApplicationController

  def new
    @flat = Flat.new
  end
  def index
    @flats = Flat.all
  end
end
