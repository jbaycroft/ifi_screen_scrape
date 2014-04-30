class CreateScrapeparams < ActiveRecord::Migration
  def change
    create_table :scrapeparams do |t|
      t.string :url
      t.integer :pages

      t.timestamps
    end
  end
end
