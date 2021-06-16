class User < ApplicationRecord
  has_secure_password
  # attr_accessor :password, :password_confirmation

  # validate :do_passwords_match, :is_password_set

  # def do_passwords_match
  #   puts "password == password_confirmation > #{@password}"
  #   password == password_confirmation
  # end

  # def is_password_set
  #   !password.nil? && password_confirmation.nil? 
  # end
end