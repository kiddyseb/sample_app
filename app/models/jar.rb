class Jar < ActiveRecord::Base
  attr_accessible :jarG, :jarGState, :jarIndex, :jarPctRev, :jarVolts, :voltState
  belongs_to :site

end
