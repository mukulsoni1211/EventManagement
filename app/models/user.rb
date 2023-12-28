class User < ApplicationRecord
  has_secure_password

  has_and_belongs_to_many :roles, join_table: :roles_users
  has_many :events
  has_many :bookings
  has_many :events, through: :bookings
end
