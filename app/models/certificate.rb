class Certificate < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :expiration_date
  def self.all_certificates
    %w(EMT)
  end
end
