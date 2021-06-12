class CreateYells < ActiveRecord::Migration[6.1]
  def change
    create_table :yells do |t|
      t.references :author, references: :users
      t.text :text

      t.timestamps
    end
  end
end
