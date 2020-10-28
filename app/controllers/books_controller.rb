class BooksController < ApplicationController
  def search
    @books = RakutenWebService::Books::Book.search(title: params[:keyword]) if params[:keyword]
  end



  def index
    @books = Book.includes(:user)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:image_url, :title, :author, :url).merge(user_id: current_user.id)
  end

end
