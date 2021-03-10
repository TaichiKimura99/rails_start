class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.string :title
      t.string :content
      t.string :line
      t.boolean :delay

      t.timestamps
    end
  end
end
