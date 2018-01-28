class CreateErpRecruitmentsRecruitApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_recruitments_recruit_applications do |t|
      t.references :recruitment, index: true, references: :erp_recruitments_recruitments
      t.string :name
      t.string :email
      t.string :gender
      t.string :position
      t.text :note
      t.string :cv_file
      

      t.timestamps
    end
  end
end
