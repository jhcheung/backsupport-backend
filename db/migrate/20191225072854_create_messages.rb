class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :users, null: false, foreign_key: true
      t.references :tickets, null: false, foreign_key: true

      t.timestamps
    end
  end
end
