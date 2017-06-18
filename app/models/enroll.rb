class Enroll < ApplicationRecord
  belongs_to :staff
  belongs_to :device
  
  validates :staff,:device,:start_date, presence: true
  validates :start_date, :end_date, :overlap => {:scope => :device_id}         
  validates :start_date, :timeliness => {:before => :end_date,:before_message => "must be less then end date."}  
  
  def active?
      enroll = Enroll.find(self.id)     
      if Date.today.between?(enroll.start_date, enroll.end_date.nil? ? Date.today : enroll.end_date)
        return true
      else
        return false   
      end      
  end
  
end
