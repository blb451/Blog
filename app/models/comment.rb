class Comment < ApplicationRecord
  validates :body, presence: true, uniqueness: {case_sensitive: false, message: "must be unique"}
end
