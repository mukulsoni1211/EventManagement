class User < ApplicationRecord
  has_and_belongs_to_many :roles, join_table: :roles_users
  has_many :events
end
