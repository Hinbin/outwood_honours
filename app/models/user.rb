# frozen_string_literal: true

class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable,
         :validatable, :omniauthable, omniauth_providers: %i[google_oauth2]

  enum role: %i[student staff inactive]

  belongs_to :school, optional: true
  has_many :badge_requests

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    user
  end

  def to_label
    return email unless given_name.present? && family_name.present?
    
    "#{given_name.first} #{family_name} - #{email}"
  end
end
