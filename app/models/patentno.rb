class Patentno < ActiveRecord::Base
	has_and_belongs_to_many :caseinfos

  

	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |patentno|
	      csv << patentno.attributes.values_at(*column_names)
	    end
	  end
	end


end
