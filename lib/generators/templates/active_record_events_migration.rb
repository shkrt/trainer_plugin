class CreateEvents < ActiveRecord::Migration
  def change
    create_table :ahoy_events, id: false do |t|
      t.uuid :id, default: nil, primary_key: true
      t.uuid :visit_id, default: nil

      t.integer <%= user_class %>

      t.string :name
      t.json :properties
      t.timestamp :time
    end

    add_index :ahoy_events, [:visit_id]
    add_index :ahoy_events, [<%= user_class %>]
    add_index :ahoy_events, [:time]
  end
end
