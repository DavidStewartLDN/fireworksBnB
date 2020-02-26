class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
    end

    create_table :spaces do |t|
      t.string :property_name
      t.text :description
      t.integer :price
      t.belongs_to :user, foreign_key: true
    end

    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :confirmation
      t.belongs_to :space, foreign_key: true
      t.belongs_to :user, foreign_key: true
    end

  end

end
