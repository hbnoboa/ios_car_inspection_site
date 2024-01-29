class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         :confirmable

  # Add custom fields
  validates :name, :login, presence: true
  enum role: [:user, :manager, :admin] # Adjust roles as needed

end
