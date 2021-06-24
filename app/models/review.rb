class Review < ApplicationRecord
    belongs_to :reviewable,polymorhpic: true   
    belongs_to :user
end