class CreateRepos < ActiveRecord::Migration[5.0]
  def change
    create_table :repos, {:id=> false, :primary_key => :id}  do |t|
      t.integer :id
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end

