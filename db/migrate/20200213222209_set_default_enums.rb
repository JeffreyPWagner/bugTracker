class SetDefaultEnums < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:bugs, :issue_type, 0)
    change_column_default(:bugs, :priority, 0)
    change_column_default(:bugs, :status, 0)
  end
end
