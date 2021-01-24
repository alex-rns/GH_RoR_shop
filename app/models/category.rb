# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :bigint
#
class Category < ApplicationRecord
  has_many :products
  has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  # belongs_to :parent_category, :class_name => "Category"
  validates :name, presence: true

  def to_param
    "#{id} - #{name}".parameterize
  end
end
