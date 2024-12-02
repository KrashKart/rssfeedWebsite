class CreateHeadlines < ActiveRecord::Migration[8.0]
  def change
    create_table :headlines do |t|
      t.string :title
      t.string :link
      t.text :description

      t.timestamps
    end
  end
end
