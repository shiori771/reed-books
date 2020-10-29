class BooksController < ApplicationController
  def search
    if params[:keyword].present?
      @books = RakutenWebService::Books::Book.search(title: params[:keyword]) if params[:keyword]
    else
      render :search
    end
  end


  def new
    @image = RakutenWebService::Books::Book.search(params[:large_image_url])
    @title = RakutenWebService::Books::Book.search(params[:title])
    @author = RakutenWebService::Books::Book.search(params[:author])
    @url = RakutenWebService::Books::Book.search(params[:url])
  end

  # def index
  #   @books = Book.includes(:user)
  # end


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
    params.permit(:image_url, :title, :author, :url, :user_id)
  end

end
