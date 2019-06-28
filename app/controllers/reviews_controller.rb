class ReviewsController < ApplicationController

def new
  @book = Book.find(params[:book_id])
  @review = @book.reviews.new
end

def create
  book = Book.find(params[:book_id])
  @review = Review.create(:reviewable=>book,:body=>review_params[:body],:user_id=>current_user.id)
  redirect_to book
end

def edit
  @book = Book.find(params[:book_id])
  @review = @book.reviews.find(params[:id])
end

def update
  @book = Book.find(params[:book_id])
  @review = @book.reviews.find(params[:id])
  @review.update(review_params)
  redirect_to @book
end

def destroy
  book = Book.find(params[:book_id])
  @review = book.reviews.find(params[:id])
  @review.destroy
  redirect_to book
end

  private
    def review_params
      params.require(:review).permit(:body)
    end
end
