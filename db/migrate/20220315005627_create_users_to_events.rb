class CreateUsersToEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :users_to_events do |t|

      t.timestamps
    end
  end
end
