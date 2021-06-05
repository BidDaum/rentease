class AddTitleToApply < ActiveRecord::Migration[6.0]
  def change
    add_column :applies, :title, :string
  end
end
