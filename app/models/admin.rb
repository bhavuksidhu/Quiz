class Admin < ApplicationRecord
  has_secure_password
  devise :omniauthable, omniauth_providers: [:google_oauth2,:facebook,:linkedin,:github,:twitter]
  has_one :profile
  after_commit :save_profile
  def self.from_google(from_google_params)
    create_with(uid: from_google_params[:uid], full_name: from_google_params[:full_name], avatar_url: from_google_params[:avatar_url],password: "test").find_or_create_by!(email: from_google_params[:email])
  
  end

  def self.from_twitter(twiterparams)
    create_with(uid: twiterparams[:uid], full_name: twiterparams[:full_name], avatar_url: twiterparams[:avatar_url]).find_or_create_by!(email: twiterparams[:email])
  end

  def self.sign_up_with_credentials(adminparams)
    Admin.create(full_name: adminparams[:full_name],email: adminparams[:email], phone_number: adminparams[:phone_number], password: adminparams[:password])
  end

  def self.find_for_database_authentication(loginparams)
    find_by(phone_number: loginparams) || find_by(email: loginparams)
  end

  def save_profile
    Profile.create_with(first_name: self.full_name,email: self.email,admin: self ).find_or_create_by!(email: self.email)
  end
end
