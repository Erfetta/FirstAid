class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      ## Informazioni report
      t.timestamps
      t.string :coordinates, null: false

      ## Link
      t.string :user_id, null: false, foreign_key: true
      t.string :operator_id, default: nil, foreign_key: true

      ## Risposte alle domande
      t.string :question1
      t.string :question2
      t.string :question3
      t.string :question4
      t.string :question5
      t.string :question6
      t.string :question7
      t.string :question8
      t.string :question9
      t.string :question10
      t.string :question11
      t.string :question12
      t.string :question13
      t.string :question14

      t.integer :contact_metod, null: false # 0 = null, 1 = chiamata, 2 = chat

    end
  end
end
