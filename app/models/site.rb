class Site < ActiveRecord::Base
  acts_as_gmappable

  attr_accessible :name, :address, :gmaps, :latitude, :longitude
  belongs_to :user
  has_many :jars, dependent: :destroy
  validates :user_id, presence: true

  def gmaps4rails_address
	#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  		address
	end

	def gmaps4rails_title
      # add here whatever text you desire
      name
    end
end
