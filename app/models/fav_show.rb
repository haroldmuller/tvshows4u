class FavShow < ApplicationRecord
  belongs_to :user
  belongs_to :tv_show
end
