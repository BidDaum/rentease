class AddCheklistToApplies < ActiveRecord::Migration[6.0]
  def change
    add_column :applies, :checklist, :integer, default: 1
  end
end
