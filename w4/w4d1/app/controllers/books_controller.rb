class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def new
    render :new
  end

  def create
    book = Book.new(book_params)
    if book.save!
      redirect_to books_url
    else
      flash.now[:errors]
    end
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
