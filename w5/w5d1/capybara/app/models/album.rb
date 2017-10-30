class Album < ApplicationRecord
  validates :title, :year, :live, :band, presence: true
  validates :title, uniqueness: {
    scope: :band,
    message: "Band can't have two of the same album name."
  }

  belongs_to :band

  def band_name
    self.band.name
  end

end
