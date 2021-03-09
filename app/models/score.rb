class Score < ApplicationRecord
  belongs_to :wine
  belongs_to :enologist
  has_many :magazines, through: :roles
end
