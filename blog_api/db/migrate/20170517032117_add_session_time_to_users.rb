class AddSessionTimeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :session_time, :datetime
  end
end
