class CreateSchoolOrganisationPaths < ActiveRecord::Migration[6.0]
  def change
    create_table :school_organisation_paths do |t|
      t.references :school, null: false, foreign_key: true
      t.string :org_path
      t.string :string

      t.timestamps
    end
  end
end
