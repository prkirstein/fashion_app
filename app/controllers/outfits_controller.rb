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

  def update
      @outfit = get_outfit
      if @outfit.update(outfit_params)
        redirect_to outfit_path(@outfit), notice: "Outfit successfully updated"
      else
        render "edit"
      end
    end


  def create
    @outfit = Outfit.new(outfit_params)

    if @outfit.save
      redirect_to @outfit
    else
      render 'new'
    end
  end

  def edit
    @outfit = get_outfit
  end

  def destroy
    @outfit = get_outfit
    @outfit.destroy
    redirect_to outfits_path
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
