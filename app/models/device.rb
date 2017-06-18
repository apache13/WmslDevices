class Device < ApplicationRecord
  has_many :enrolls ,:dependent => :restrict_with_exception
  has_many :staffs, through: :enrolls
  validates :name, presence: true
  validates :code, presence: true , uniqueness: true
  
  def using?
      return Enroll.where(status: true,device_id: self.id).exists?      
  end
  
  def enrolled?
      return Enroll.where(device_id: self.id).exists?      
  end
  
  def active_enrolls
      return Enroll.where(device_id: self.id,status: true)    
  end
  
  def display
    return "#{self.name} (#{self.code})"
  end
  
  def display_avalible
    if using?
      return "#{self.name} (#{self.code}) *"
    else
      return "#{self.name} (#{self.code})"
    end    
  end
  
end
