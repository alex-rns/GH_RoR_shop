# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  product_id :bigint
#  body       :text
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates_presence_of :body, :rating
  validates_uniqueness_of :user_id, scope: :product_id
end
