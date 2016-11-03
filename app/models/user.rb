class User < ApplicationRecord
  attr_accessor :current_password
  has_many :comments, dependent: :nullify
  has_many :posts, dependent: :nullify
  has_many :favourites, dependent: :destroy
  has_many :favourite_posts, through: :favourites, source: :post
  has_many :stars, dependent: :destroy
  has_many :starred_posts, through: :stars, source: :post

  has_secure_password

  before_validation :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: {case_sensitive: false },
                    format: VALID_EMAIL_REGEX

  def full_name
   "#{first_name} #{last_name}".strip.squeeze(' ').titleize
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
  end

  private

  def downcase_email
    self.email.downcase! if email.present?
  end

end
