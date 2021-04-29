class CreateActors < ActiveRecord::Migration[5.0]
  def change
    create_table :actors, {:id=> false, :primary_key => :id} do |t|
      t.integer :id
      t.string :login
      t.string :avatar_url
    end
  end
end
