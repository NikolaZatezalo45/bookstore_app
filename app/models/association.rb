class Association < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :association_type, presence: true, inclusion: { in: %w(author purchaser),
  message: "Association %{value} is not one of the types available."
}
end
