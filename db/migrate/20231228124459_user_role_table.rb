class UserRoleTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :roles, :users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
    end
  end
end
