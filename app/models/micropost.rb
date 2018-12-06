class Micropost < ApplicationRecord
  belongs_to :user
  scope :sorted, ->{order created_at: :desc}
  mount_uploader :picture, PictureUploader
  validates :user, presence: true
  validates :content, presence: true, length: {maximum: Settings.length_micro}
  validate :picture_size

  private

  def picture_size
    return unless picture.size > Settings.picture_size.megabytes
    errors.add :picture, t(".should_be_less_than_5MB")
  end
end
