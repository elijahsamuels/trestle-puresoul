class Article < ApplicationRecord
  
  # example for movie with dates
  # scope :between, ->(from, to) { where("year >= :from AND year <= :to", from: from, to: to) }
  # scope :with_sample_in_title, -> {where}
  # scope :with_long_title, -> { where("LENGTH(title) > 20") }


end
