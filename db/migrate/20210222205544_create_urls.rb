class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string   :token,       null: false
      t.string   :long_url,    null: false
      t.integer  :counter,     default: 0
      t.datetime :expired_at
      t.datetime :created_at,  null: false
    end
    add_index :urls, :token, unique: true
  end
end
