class CreateErpRecruitmentsRecruitments < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_recruitments_recruitments do |t|
      t.string :name
      t.date :deadline
      t.string :position
      t.string :salary_grade
      t.text :task
      t.text :require
      t.text :interest
      t.text :description
      t.string :status
      t.string :meta_keywords
      t.string :meta_description
      t.references :creator, index: true, references: :erp_users

      t.timestamps
    end
  end
end
