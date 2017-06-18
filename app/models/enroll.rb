class Enroll < ApplicationRecord
  belongs_to :staff
  belongs_to :device
  
  validates :staff,:device,:start_date, presence: true         
  validates :start_date, :timeliness => {:before => :end_date,:before_message => "must be less then end date."}  
  validates :start_date, :end_date, :overlap => {:scope => :device_id}
     
  def validate_device_using?
      if self.status
        return Device.find(self.device_id).using?
      else
        return false
      end        
  end
  
end
