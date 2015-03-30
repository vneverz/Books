class AddReleaseToEvents < ActiveRecord::Migration
  def change
    add_column :events, :release, :date
  end
end
