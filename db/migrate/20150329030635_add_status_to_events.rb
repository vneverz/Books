class AddStatusToEvents < ActiveRecord::Migration
  def change
    add_column :events, :status, :varchar
  end
end
