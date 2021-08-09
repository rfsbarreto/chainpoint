class Badge < ApplicationRecord
  has_one :chainpoint_node, class_name: 'Chainpoint::Node'

  validates :badge_uuid, :issue_date, :recipient_name, presence: true

  def calculate_hash
    Digest::SHA256.hexdigest(badge_uuid)
  end
end
