class BookPurchasesController < ApplicationController
  def create
    @user=User.find(current_user.id)
    @user.purchaser_associations.create(:user_id=>current_user.id,:book_id=>params["purch_book"],:association_type=>'purchaser')
  end
end
