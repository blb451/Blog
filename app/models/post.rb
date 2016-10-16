class Post < ApplicationRecord
  validates :title, presence: true, uniqueness: {case_sensitive: false, message: "must be unique"}
end
