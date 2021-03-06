class User < ApplicationRecord
  enum role: {student: 0, admin: 1, supperadmin: 2}
  devise :database_authenticatable, :encryptable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :lockable, :timeoutable

  has_many :course_users, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :homework_results, dependent: :destroy

  before_save :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.user.max_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.user.min_password}, allow_nil: true

  scope :order_asc, -> {order id: :asc }
  scope :by_role, -> (role){ where role: role }

  def current_user? user
    self == user
  end

  private

  def downcase_email
    email.downcase!
  end
end
