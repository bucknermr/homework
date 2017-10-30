class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    return unknown_band_error unless find_band
    render :edit
  end

  def show
    return unknown_band_error unless find_band
    render :show
  end

  def update
    return unknown_band_error unless find_band

    unless @band.update_attributes(band_params)
      flash[:errors] = @band.errors.full_messages
    end

    redirect_to band_url(@band)
  end

  def destroy
    return unknown_band_error unless find_band

    if @band.destroy
      redirect_to bands_url
    else
      flash[:error] = @band.errors.full_messages
      redirect_to band_url(@band)
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

  def find_band
    @band = Band.find_by(id: params[:id])
  end

  def unknown_band_error
    flash[:errors] = "We can't find that band!"
    redirect_to bands_url
  end
end
