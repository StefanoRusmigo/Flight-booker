class RenameTable < ActiveRecord::Migration[5.1]
  def change
  	rename_table :passsengers,:passengers
  end
end
