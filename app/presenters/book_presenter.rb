class BookPresenter

  def initialize(book)
    @book = book
  end

  def fullname
    "#{@book.user.first_name} #{@book.user.last_name}"
  end

end
