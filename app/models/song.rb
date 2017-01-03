require 'pry'
class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year}
  # validates :released, inclusion: {in: [true, false]}
  validate :release_year_presence
  validate :release_year_year
  validates :artist_name, presence: true

  private

  def release_year_presence
    if released
      if release_year == nil
        errors.add(:release_year, ' must not be blank')
      end
    end
  end

  def release_year_year
    if release_year
      if Time.new.year < release_year
        errors.add(:release_year, ' cannot be in the future')
      end
    end
  end


end
