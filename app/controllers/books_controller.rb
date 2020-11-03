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
    @book = Book.new()
      @isbn = RakutenWebService::Books::Book.search(params[:isbn])
      @image = RakutenWebService::Books::Book.search(params[:large_image_url])
      @title = RakutenWebService::Books::Book.search(params[:title])
      @author = RakutenWebService::Books::Book.search(params[:author])
      @url = RakutenWebService::Books::Book.search(params[:url])
      @authenticity_token = RakutenWebService::Books::Book.search(params[:authenticity_token])
  end
  
  def create
    @book = Book.new(book_params)
     if @book.save
      redirect_to books_path
    else
      redirect_to action: :index
      # redirect_back(fallback_location: new_book_path)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to action: :index
    end
  end

  private

  def book_params
    params.require(:book).permit(:id, :isbn, :image_url, :title, :author, :url).merge(user_id: current_user.id)
  end
end
