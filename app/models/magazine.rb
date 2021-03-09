class Magazine < ApplicationRecord

    has_many :enologists, through: :roles
    
end
