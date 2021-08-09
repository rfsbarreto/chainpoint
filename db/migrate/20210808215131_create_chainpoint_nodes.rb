class CreateChainpointNodes < ActiveRecord::Migration[6.1]
  def change
    create_table :chainpoint_nodes, id: :uuid do |t|
      t.string :proof_id

      t.timestamps
    end
  end
end
