class Staff < ApplicationRecord  
  has_many :enrolls , :dependent => :restrict_with_exception
  has_many :devices, through: :enrolls  
  validates :name, presence: true
  validates :code, presence: true , uniqueness: true
  
  def active_enrolls
    Enroll.where(staff_id: self.id,status: true)
  end
   
  def display
    return "#{self.name} (#{self.code})"
  end
       
end
