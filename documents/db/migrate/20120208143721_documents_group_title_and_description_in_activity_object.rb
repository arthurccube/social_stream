class DocumentsGroupTitleAndDescriptionInActivityObject < ActiveRecord::Migration
  def up
    # Fix 'documents' table
    Document.all.each do |d|
      d.activity_object.title = d.title
      d.activity_object.description = d.description
      d.save!
    end
    change_table :documents do |t|
      t.remove :title
      t.remove :description
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration # Due to trans-gem oddities
  end
end
