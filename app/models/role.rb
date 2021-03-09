class Role < ApplicationRecord
  belongs_to :enologist
  belongs_to :magazine
end
