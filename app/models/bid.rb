# == Schema Information
#
# Table name: bids
#
#  id         :bigint           not null, primary key
#  amount     :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  skin_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_bids_on_skin_id  (skin_id)
#  index_bids_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (skin_id => skins.id)
#  fk_rails_...  (user_id => users.id)
#
class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :skin

  validates :amount, presence: true, numericality: { greater_than: 0 }
end
