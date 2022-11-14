class User < ApplicationRecord

 has_secure_password

 validates :first_name, presence: true
 validates :last_name, presence: true
 validates :email, presence: true, uniqueness: { case_sensitive: false }
 validates :password, presence: true, length: {minimum: 7}, confirmation: true
 validates :password_confirmation, presence: true, length: {minimum: 7}

 def self.authenticate_with_credentials(email, password)
   email.downcase!
   email.strip!
   @user = User.find_by_email(email)
   @user ? user.authenticate(password) ? user : nil : nil
 end

 before_save :email_correction

 private

 def email_check
   self.email.downcase!
   self.email.strip!
 end

end