class Caseinfo < ActiveRecord::Base
	has_and_belongs_to_many :patentnos
end
