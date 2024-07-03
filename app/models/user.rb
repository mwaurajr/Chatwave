class User < ApplicationRecord
  # Additional columns for email verification
  attr_accessor :pin_0, :pin_1, :pin_2, :pin_3

  # Devise authentication modules
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy

  # Callbacks
  after_create :update_user_verified_column_to_true
  after_create :send_pin!

  # Method to update the user's email verification status to true
  def update_user_verified_column_to_true
    # Perform the email verification process after user creation
    UpdateUserJob.perform_now(self)
  end

  # Method to reset the PIN for email verification
  def reset_pin!
    update_column(:pin, rand(1000..9999))
  end

  # Method to unverify the user's email
  def unverify!
    update_column(:verified, false)
  end

  # Method to send the PIN for email verification
  def send_pin!
    reset_pin!
    unverify!
    # Perform the job to send the PIN
    SendPinJob.perform_now(self)
  end
end
