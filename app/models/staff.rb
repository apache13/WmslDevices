class Staff < ApplicationRecord  
  has_many :enrolls , :dependent => :restrict_with_exception
  has_many :devices, through: :enrolls  
  
  validates :name, :code, presence: true
  validates :code, uniqueness: true
  validates :name, length: { maximum: 128 }
  validates :code, length: { maximum: 64 }
  
  def display
    return "#{self.code} (#{self.name})"
  end
   
  def timeline
    enrolls = Array.new
    self.enrolls.select{|enroll| enroll.active?}.sort {|x,y| x.start_date <=> y.start_date}.each do |enroll| 
      device = [enroll.device.display, enroll.start_date, (enroll.end_date.nil? ? Date.today.end_of_day : enroll.end_date)]
      enrolls << device 
    end        
    return enrolls
  end    
end
