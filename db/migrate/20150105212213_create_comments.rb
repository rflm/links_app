class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :link, index: true
      t.belongs_to :user, index: true
      t.string :content
      
      t.timestamps
    end
  end
end
