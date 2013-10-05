class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable
  validates :name, presence: true
  validates :gender, presence: true
  validates :address, presence: true   
  has_many :orders    
end
