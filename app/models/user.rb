class User < ApplicationRecord
  has_secure_password
  
  # validates :first_name,
  #   presence: true
  # validates :last_name,
  #   presence: true
  validates :email,
    presence: true
  validates :password,
    presence: true,
    length: { in: 6..30, message: "password incorrect"}
  belongs_to :city
  has_many :leads


  def info
    return "User #{id} info is #{first_name}, #{last_name}, #{age}, #{email}, #{job}."
  end

  def full_name
    first_name + " " + last_name
  end

end
