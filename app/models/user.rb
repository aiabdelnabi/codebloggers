class User < ActiveRecord::Base
  has_many :articles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
         
  validates :name, presence: true, length: { maximum: 30 }

  def count_articles
  	self.articles.count
  end

end
