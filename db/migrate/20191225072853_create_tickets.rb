class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.boolean :open
      t.references :customer, null: false, foreign_key: {to_table: :user}
      t.references :owner, foreign_key: {to_table: :user}

      t.timestamps
    end
  end
end
