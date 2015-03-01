class Recommendation < ActiveRecord::Base
  belongs_to :course
  belongs_to :curriculum
end
