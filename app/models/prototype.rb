class Prototype < ApplicationRecord
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true

  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  validate :image_attached

  private

  def image_attached
    errors.add(:image, 'must be attached') unless image.attached?
  end

end
