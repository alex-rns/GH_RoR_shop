class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  enum status: [:in_progress, :ordered, :canceled]
end
