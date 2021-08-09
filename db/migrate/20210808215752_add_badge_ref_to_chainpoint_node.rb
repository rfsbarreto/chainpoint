class AddBadgeRefToChainpointNode < ActiveRecord::Migration[6.1]
  def change
    add_reference :chainpoint_nodes, :badge, null: false, foreign_key: true, type: :uuid
  end
end
