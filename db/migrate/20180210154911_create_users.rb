class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :points
      t.string :university
      t.string :course
      t.text :biography

      t.timestamps
    end
  end
end
