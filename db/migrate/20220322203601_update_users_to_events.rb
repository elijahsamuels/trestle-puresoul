class UpdateUsersToEvents < ActiveRecord::Migration[7.0]
  def change
    change_table :users_to_events do |t|

      add_reference :users, :event, foreign_key: true
      add_reference :events, :user, foreign_key: true

    end
  end
end
