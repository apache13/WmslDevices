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
  
end
