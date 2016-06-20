class Event < ActiveRecord::Base
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :attendees, :class_name => 'Attendances', :foreign_key => 'user_id'
  has_many :attendance, :class_name => 'Attendances', :foreign_key => 'event_id'
  has_attached_file :image, styles: { thumb: "64x64", med: "100x100", large: "300x300", xlarge: "1920x1080" }, dependent: :destroy, :default_url => "default_cal_:style.png"

  validates :title, :presence => true
  validates :description, :presence => true
  validates :start_date, :end_date, :presence => true
  validates :start_time, :presence => true
  validates :end_time, :presence => true
  validate :end_after_start
  validates :location, :presence => true
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }, size: { in: 0..10.megabytes }

  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

  accepts_nested_attributes_for :tags,
                                reject_if: proc { |attributes| attributes['name'].blank? },
                                allow_destroy: true


  private

  def end_after_start
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end


end
