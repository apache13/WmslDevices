class Device < ApplicationRecord
  has_many :enrolls ,:dependent => :restrict_with_exception
  has_many :staffs, through: :enrolls
  
  validates :name, :code, presence: true
  validates :code, uniqueness: true  
  validates :name, length: { maximum: 128 }
  validates :code, length: { maximum: 64 }
  
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
      staff = [enroll.staff.display, enroll.start_date, (enroll.end_date.nil? ? Date.today.end_of_day : enroll.end_date)]
      enrolls << staff 
    end        
    return enrolls
  end
  
end
