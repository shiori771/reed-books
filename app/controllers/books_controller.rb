class BooksController < ApplicationController

  def search
    if params[:keyword].present?
      @books = RakutenWebService::Books::Book.search(title: params[:keyword]) if params[:keyword]
    else
      render :search
    end
  end

  def index
    @books = Book.includes(:user).order('created_at DESC')
  end

  def new
    @isbn = RakutenWebService::Books::Book.search(params[:isbn])
    @image = RakutenWebService::Books::Book.search(params[:large_image_url])
    @title = RakutenWebService::Books::Book.search(params[:title])
    @author = RakutenWebService::Books::Book.search(params[:author])
    @url = RakutenWebService::Books::Book.search(params[:url])
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      redirect_back(fallback_location: new_book_path)
    end
  end

  private

  def book_params
    params.permit(:isbn, :image_url, :title, :author, :url, :user_id)
  end

end
