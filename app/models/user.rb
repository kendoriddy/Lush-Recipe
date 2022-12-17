class User < ApplicationRecord
       has_many :recipes
       has_many :foods

       validates_associated :foods
       validates_associated :recipes
       validates :name, :email, presence: true
       validates :email, uniqueness: true
       validates :name, length: { minimum: 2 }
       validates :password, length: { minimum: 6 }


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable


end
