class RemoveStringFromEntries < ActiveRecord::Migration
  def up
    remove_column :entries, :string
  end

  def down
    add_column :entries, :string, :string
  end
end
