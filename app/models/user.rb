class User < ApplicationRecord
  has_many :books
  has_many :genres, :through => :books
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :associations, dependent: :destroy
 has_many :author_associations, -> {where 'association_type = "author"'}, class_name: "Association"
 has_many :purchaser_associations, -> {where 'association_type = "purchaser"'}, class_name: "Association"

 has_many :authors, through: :author_associations, source: :book
 has_many :purchases, through: :purchaser_associations, source: :book
end
