class AddHeaderColorToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :header_color, :string, default: 'dark-sienna', null: false
  end
end
