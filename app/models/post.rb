class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments, lambda { order(created_at: :DESC) }, dependent: :destroy
  validates :title, presence: true, length: { minimum: 7 },
            uniqueness: {case_sensitive: false, message: "must be unique"}
  validates :body, presence: true

  def body_snippet
    if self.body.length > 100
      return body[0...100] << "..."
    end
  end

  

end
