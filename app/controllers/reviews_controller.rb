class ReviewsController < ApplicationController

 def new
   if defined? review_params[:review_id]
     @review = Review.find(params[:review_id])
     @rev_review = @review.reviews.new
   else
     @book = Book.find(params[:book_id])
     @review = @book.reviews.new
  end
 end

 def create
   if params[:commit]=="Create Review"
    book = Book.find(params[:book_id])
    @review = Review.create(:reviewable=>book, :body =>review_params[:body], :user_id=>current_user.id)
     redirect_to book
   else
     @review = Review.find(params[:review_id])
     @rev_review = Review.create(:reviewable=>@review, :body =>review_params[:body], :user_id=>current_user.id)
     redirect_to @review
   end
 end

 def destroy
   book = Book.find(params[:book_id])
   @review = book.reviews.find(params[:id])
   @review.destroy
   redirect_to book
 end

 def edit
   @book = Book.find(params[:book_id])
   @review = @book.reviews.find(params[:id])
 end

 def update
   book = Book.find(params[:book_id])
   @review = book.reviews.find(params[:id])
   @review.update(review_params)
   redirect_to book
 end

 def show
   @review = Review.find(params[:id])
   @rev_review = @review.reviews.all
 end

 private
   def review_params
     params.require(:review).permit(:body,:reviewable_type,:commit)
   end
end
