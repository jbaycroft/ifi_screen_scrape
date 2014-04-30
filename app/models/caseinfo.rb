class Caseinfo < ActiveRecord::Base
	has_and_belongs_to_many :patentnos

	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |caseinfo|
	      csv << casinfo.attributes.values_at(*column_names)
	    end
	  end
	end
end
