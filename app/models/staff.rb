class Staff < ApplicationRecord  
  has_many :enrolls , :dependent => :restrict_with_exception
  has_many :devices, through: :enrolls  
  validates :name, :code, presence: true
  validates :code, uniqueness: true
  
  def display
    return "#{self.code} (#{self.name})"
  end
       
end
