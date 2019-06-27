class Book < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :associations, dependent: :destroy
  has_many :authos, -> {where 'association_type = "author"'}, class_name: "User", through: :associations
  has_many :purchasers, -> {where 'association_type = "purchaser"'}, class_name: "User", through: :associations
end
