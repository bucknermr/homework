class AlbumsController < ApplicationController
  def new
    @album = Album.new
    render :new
  end

  def create
    p "HIIIIII"
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url(@album.band)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :band_id, :live)
  end
end
