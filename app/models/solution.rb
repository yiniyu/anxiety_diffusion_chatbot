class Solution < ApplicationRecord
  # Direct associations

  belongs_to :emotion,
             :counter_cache => true

  # Indirect associations

  # Validations

end
