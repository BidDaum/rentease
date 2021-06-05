class AddCountToApply < ActiveRecord::Migration[6.0]
  def change
    add_column :applies, :count, :integer, default: 0
  end
end
