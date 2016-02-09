class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits, id: false do |t|
      t.uuid :id, default: nil, primary_key: true
      t.uuid :visitor_id, default: nil

      t.integer <%= user_class %>

      t.timestamp :started_at
    end

    add_index :visits, [<%= user_class %>]
  end
end
