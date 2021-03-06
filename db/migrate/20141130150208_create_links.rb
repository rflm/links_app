class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :url
      t.string :thumbnail_url
      t.string :description
      
      t.timestamps
    end
  end
end
