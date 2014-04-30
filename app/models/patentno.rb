class Patentno < ActiveRecord::Base
	has_and_belongs_to_many :caseinfos
end
