class Staff < ApplicationRecord  
  has_many :enrolls , :dependent => :restrict_with_exception
  has_many :devices, through: :enrolls  
  validates :name, :code, presence: true
  validates :code, uniqueness: true
  
  def display
    return "#{self.code} (#{self.name})"
  end
   
  def timeline
    enrolls = Array.new
    self.enrolls.select{|enroll| enroll.active?}.sort {|x,y| x.start_date <=> y.start_date}.each do |enroll| 
      device = [enroll.device.display, enroll.start_date, (enroll.end_date.nil? ? Date.tomorrow : enroll.end_date+1.day)]
      enrolls << device 
    end        
    return enrolls
  end    
end
