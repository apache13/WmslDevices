class Enroll < ApplicationRecord
  belongs_to :staff
  belongs_to :device
  
  before_validation :ensure_start_time_and_end_time
  
  validates :staff,:device,:start_date, presence: true
  validates :start_date, :end_date, :overlap => {:scope => :device_id}         
  validates :start_date, :timeliness => {:before => :end_date, :before_message => "must be less then end date."}
  validates :start_date, :timeliness => {:on_or_before => Date.today.beginning_of_day , :on_or_before_message => "must be less then or equal current date."}   
  
  private
  def ensure_start_time_and_end_time 
    self.start_date = self.start_date.beginning_of_day
    if !self.end_date.nil?
      self.end_date = self.end_date.end_of_day
    end
  end
  
  public
  def active?
      enroll = Enroll.find(self.id)     
      if Date.today.between?(enroll.start_date, enroll.end_date.nil? ? Date.today : enroll.end_date)
        return true
      else
        return false   
      end      
  end
  
end
