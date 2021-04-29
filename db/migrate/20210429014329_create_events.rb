class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events, {:id=> false, :primary_key => :id} do |t|
      t.integer :id
      t.string :type
      t.string :created_at #no recuerdo la zona horaria
      t.references :actor, foreign_key: true
      t.references :repo, foreign_key: true
    end
  end
end
