class Review < ApplicationRecord
    belongs_to :reviewable,polymorhpic: true   
end