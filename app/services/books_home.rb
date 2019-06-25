class BooksHome

  def initialize(current_user)
    if current_user
    @current_user = current_user.id
    end
  end

  def filterBooks
    # @books = Book.all
    # @books.reject { |b|  b.user_id == @current_user }
    @books = Book.where.not(user_id: @current_user)
  end

end
