module Chainpoint
  class Node < ApplicationRecord
    self.table_name = 'chainpoint_nodes'
    belongs_to :badge

    validates :proof_id, :badge, presence: true

    def self.build_from_badge(badge)
      chainpoint_response = Client.submit(badge.calculate_hash)

      node_params = chainpoint_response&.fetch('hashes')&.first

      node = Node.new(proof_id: node_params&.fetch('proof_id'), badge: badge)

      node.reload if node.save
    end
  end
end
