class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
          :confirmable

  has_one :cart, dependent: :destroy
  has_one :wishlist, dependent: :destroy
  has_many :reviews, dependent: :destroy
  
  validates :first_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }
  validates :phone, presence: true, length: { minimum: 3, maximum: 50 }
  validates :address1, presence: true, length: { minimum: 3, maximum: 50 }
  validates :address2, presence: true, length: { minimum: 3, maximum: 50 }
  validates :city, presence: true, length: { minimum: 3, maximum: 50 }
  validates :state, presence: true, length: { minimum: 3, maximum: 50 }
  validates :postal_code, presence: true, length: { minimum: 3, maximum: 50 }
  validates :country, presence: true, length: { minimum: 3, maximum: 50 }

  def admin?
    role == 'admin'
  end
end
