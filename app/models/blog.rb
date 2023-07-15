class Blog < ApplicationRecord
  validates :content, length: {minimum:1, maximum:140}
  validates :title, length: {minimum:1}
end
