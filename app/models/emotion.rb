class Emotion < ApplicationRecord
  # Direct associations

  has_one    :perspective,
             :dependent => :destroy

  belongs_to :user,
             :required => false,
             :counter_cache => true

  # Indirect associations

  # Validations

end
