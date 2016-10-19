class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 7 },
            uniqueness: {case_sensitive: false, message: "must be unique"}
  validates :body, presence: true

  def body_snippet
    if self.body.length > 100
      return body[0...100] << "..."
    end
  end

end
