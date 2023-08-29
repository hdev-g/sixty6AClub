class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :desk

  validates :date, presence: true

  def self.to_csv
    CSV.generate do |csv|
      csv << attribute_names
      all.each do |record|
        csv << record.attributes.values
      end
    end
  end
end
