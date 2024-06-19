class User < ApplicationRecord
  has_secure_password # enables password and password_confirmation thanks to password_digest
end
