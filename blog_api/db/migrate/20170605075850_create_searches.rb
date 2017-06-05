class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :fullname
      t.string :tag
      t.string :category
      t.string :name
      t.references :article, foreign_key: true
      t.timestamps
    end
  end
end
