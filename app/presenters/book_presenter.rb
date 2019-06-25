class BookPresenter < BasePresenter

  def initialize(user, template)
    @user = user
    @template = template
    @books = Book.all
  end

  def h
    @template
  end

end
