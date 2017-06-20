class Device < ApplicationRecord
  has_many :enrolls ,:dependent => :restrict_with_exception
  has_many :staffs, through: :enrolls
  validates :name, :code, presence: true
  validates :code, uniqueness: true
  
  def using?
      enrolls.select {|enroll| enroll.active?}.each do |enroll|     
        return true       
      end      
      return false
  end
    
  def display
    return "#{self.code} (#{self.name})"
  end
  
  def timeline
    enrolls = Array.new
    self.enrolls.sort {|x,y| x.start_date <=> y.start_date}.each do |enroll|
      staff = [enroll.staff.display, enroll.start_date, (enroll.end_date.nil? ? Date.tomorrow : enroll.end_date+1.day)]
      enrolls << staff 
    end        
    return enrolls
  end
  
end
