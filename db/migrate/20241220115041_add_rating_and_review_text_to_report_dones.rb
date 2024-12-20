class AddRatingAndReviewTextToReportDones < ActiveRecord::Migration[6.1]
  def change
    add_column :report_dones, :rating, :integer
    add_column :report_dones, :review_text, :text
  end
end
