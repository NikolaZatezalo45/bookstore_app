class BooksController < ApplicationController
  def create
    @user = User.find(current_user.id)
    @books = @user.books.create(book_params)
    redirect_to books_url
  end


  def index
    if current_user
    @user = User.find(current_user.id)
    @books = @user.books.all
    else
      @books = Book.all
    end
  end

  def new
    @user = User.find(current_user.id)
    @book = @user.books.new
  end

private
def book_params
params.require(:book).permit(:name,:description,:publish_date,:genre_id,:user_id)
end
end
