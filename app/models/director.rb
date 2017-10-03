class Director < ApplicationRecord
  has_many :tv_shows

  def set_complete_name
    "#{first_name} #{last_name}"
  end

end
