class CreateSupportRequests < ActiveRecord::Migration
  def change
    create_table :support_requests do |t|
      t.string :name
      t.string :email
      t.text :message
      t.string :department
      t.boolean :done#, default: false

      t.timestamps null: false
    end
  end
end
