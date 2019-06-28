class BooksController < ApplicationController

 def new
   @user = User.find(current_user.id)
   @book = @user.books.new
 end

 def create
   @user = User.find(current_user.id)
   @book = @user.books.create(book_params)
   @user.author_associations.create(:user_id=>current_user.id,:book_id=>@book.id,:association_type=>'author')
   redirect_to books_url
 end

 def index
   @books = BooksHome.new(current_user).filterBooks
 end

 def show
   @book = Book.find(params[:id])
   @reviews = @book.reviews
 end

 def edit
   @user = User.find(current_user.id)
   @book = @user.books.find(params[:id])
 end

 def update
   @user = User.find(current_user.id)
   @book = @user.books.find(params[:id])
   @book.update(book_params)
   redirect_to @book
 end

 def destroy
   @user = User.find(current_user.id)
   @book = @user.books.find(params[:id])
   @book.destroy
   redirect_to pages_path
 end

 private

 def book_params
 params.require(:book).permit(:name,:description,:date_published,:genre_id,:user_id)
 end

end
