class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges, id: :uuid do |t|
      t.date :issue_date
      t.string :recipient_name
      t.string :badge_uuid

      t.timestamps
    end
  end
end
