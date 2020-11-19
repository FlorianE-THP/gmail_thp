class EmailChange < ActiveRecord::Migration[6.0]
  def change
    add_column :emails, :status, :boolean
  end
end
