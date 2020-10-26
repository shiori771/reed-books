class BooksController < ApplicationController
  def search
    @books = RakutenWebService::Books::Book.search(title: params[:keyword]) if params[:keyword]
  end
end
