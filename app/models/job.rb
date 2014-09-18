class Job < ActiveRecord::Base
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  belongs_to :company

  validates :title, presence: true
  validates :company, presence: true
  validates :description, length: { maximum: 5000 }
end
