class PagesController < ApplicationController
  def index
    @books=Book.where(user_id: current_user.id)
    @purch_books = current_user.purchases
  end
end
