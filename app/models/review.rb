class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :user
  has_many :reviews, as: :reviewable, dependent: :destroy
end
