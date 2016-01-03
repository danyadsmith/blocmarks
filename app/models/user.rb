class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :username, :first_name, :middle_initial, :last_name

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :username, :presence => true, :uniqueness => true
end
