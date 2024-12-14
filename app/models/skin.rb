# == Schema Information
#
# Table name: skins
#
#  id             :bigint           not null, primary key
#  description    :text
#  image_url      :string
#  name           :string
#  starting_price :decimal(, )
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_skins_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Skin < ApplicationRecord
  belongs_to :user
  # has_many :bids, dependent: :destroy
  has_many(:skinbids,class_name: "Bid", foreign_key: "skin_id")
  has_one_attached :image # If you're using ActiveStorage for image uploads

  validates :name, :starting_price, presence: true
end
