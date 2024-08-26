class MakeOperatorIdNullableInReports < ActiveRecord::Migration[6.0]
  def change
    change_column_null :reports, :operator_id, true
  end
end
