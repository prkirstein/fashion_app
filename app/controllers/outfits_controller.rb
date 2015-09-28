class OutfitsController < ApplicationController
  def index
    @outfits = Outfit.all
  end

  def show
    @outfit = get_outfit
  end

  def new
    @outfit = Outfit.new
  end

  def edit
    @outfit = get_outfit
  end

private

  # for great safety!
  def outfit_params
    params.require(:outfit).permit(:name, :image_url, :description)
  end

  def get_outfit
    Outfit.find(params[:id])
  end
end
