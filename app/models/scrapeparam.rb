class Scrapeparam < ActiveRecord::Base

	# Method for indexing case information by patent number
	def self.index_patents
		#Create an array of all Caseinfo files.
		cases = Caseinfo::Caseinfo.all.to_a
		# Itterate through each case file.
		cases.each do |c|
			# For each case file create a patent number array that scans for patent numbers
		    pnarray = c.patno.scan(/[\d,]+/)
		    	puts pnarray # Put array to log as a test.
		    # For each patent number in the array create a new record that belongs to current case file. 
		    pnarray.each do |pn|
		    	c.patentnos.create(:patno => pn)
		    end
    	end
	end


	# Method for scraping ITC case listing and files into a database.
	def self.screen_scrape
		#require necessary gems and components.
		require "rubygems"
		require "nokogiri"
		require "open-uri"
		require "mechanize"
		require "csv"

		#Initializing core components of Mechanize and Nokogiri.
			#Set base url for Screen Scraping application.
			url = "http://info.usitc.gov/ouii/public/337inv.nsf/All?OpenView"
			#Initialize base url for Nokogiri based on url variable.
			doc = Nokogiri::HTML(open(url))
			#Initialize Mechanize agent variable
			agent = Mechanize.new
			#Initialize page for Mechanize agent
			page = agent.get("http://info.usitc.gov/ouii/public/337inv.nsf/All?OpenView")
			#Initialize CSV Core File
			csv = CSV.open("/tmp/outputTEST.csv", 'w',{:col_sep => ",", :quote_char => '\'', :force_quotes => true})


		#Initialize Arrays for CSV exporting.
		#Initialize list of all case paths array
		paths_array = Array.new


		#Initialize i to 0
		i = 0
		# Change the number below to match the number of pages of cases to extract. 
		while i < 32
			#Set page to url defined above
			page = agent.get(url)

			#Define Nokogiri document
			doc = Nokogiri::HTML(open(url, 'r', :read_timeout =>60))

			#Iterate through each link on the page to gather data specific to that link(case) 
			#and to generate array of links for later use
			doc.css("font a").each do |item|
				

				#Add the link to the paths_array
			    	paths_array.push(item[:href])

			    #Set a link variable to contain the :href of the current link. 
			    	link = item[:href]
			    #Set a suburl to identify the new page for Nokogiri using the link variable
			    	suburl = agent.click(page.link_with(:href => link)).uri.to_s
			    retryable(:tries => 10, :on => Timeout::Error) do
					    #Set the subpage using the suburl
					    	subpage = Nokogiri::HTML(open(suburl, 'r', :read_timeout =>5*60))
						#Extract the Investigation number to be used to determine whether a case record already exists.
						invnum = subpage.css('table:nth-child(3) tr:nth-child(1) td:nth-child(2)').text	
							puts invnum
						# Set caseinfo variable to either the caseinfo identified above or a new caseinfo
					    caseinfo = Caseinfo::Caseinfo.find_by(:invno, invnum) || Caseinfo::Caseinfo.new(:invno => invnum)
						#Extract patent number number from page
					    
					    	
					    	#Populate Caseinfo fields with the specific information identified from the page
					    	#Patent Number as a string including the words US Patent No:
						    caseinfo.patno = subpage.css('tr:nth-child(4) font').text
						    	puts caseinfo.patno
						    #Investigation Number
							caseinfo.invno = subpage.css('table:nth-child(3) tr:nth-child(1) td:nth-child(2)').text	
								puts caseinfo.invno
							#In the Matter of Concern
							caseinfo.itmoc = subpage.css('tr:nth-child(2) font').text
								puts caseinfo.itmoc
							#Unfair Acts in Notice
							caseinfo.uain = subpage.css('table:nth-child(3) tr:nth-child(3) font').text
								puts caseinfo.uain
							#Complainant
							caseinfo.complaint = subpage.css('tr:nth-child(8) font').text
								puts caseinfo.complaint
							#Country of Origin
							caseinfo.country = subpage.css('tr:nth-child(5) font').text
								puts caseinfo.country
							#Respondents
							caseinfo.respondents = subpage.css('tr:nth-child(9) font').text
								puts caseinfo.respondents
							#ALJ
							caseinfo.alj = subpage.css('tr:nth-child(10) font').text
								puts caseinfo.alj
							#OUII Attorney
							caseinfo.ouiiattorney = subpage.css('tr:nth-child(11) font').text
								puts caseinfo.ouiiattorney
							#GC Attorney
							caseinfo.gcattorney = subpage.css('tr:nth-child(12) font').text
								puts caseinfo.gcattorney
							#Status Before Commission
							caseinfo.statusbeforecommission = subpage.css('tr:nth-child(15) font').text
								puts caseinfo.statusbeforecommission
							#Notice of Investigation
							caseinfo.noticeofinv = subpage.css('tr:nth-child(16) font').text
								puts caseinfo.noticeofinv
							#Type of Proceeding
							caseinfo.proceedtype = subpage.css('tr:nth-child(17) font').text
								puts caseinfo.proceedtype
							#Current Phase of Proceeding
							caseinfo.currentphase = subpage.css('tr:nth-child(18) font').text
								puts caseinfo.currentphase
							#Inv. Termination Date
							caseinfo.invtermdate = subpage.css('tr:nth-child(20) font').text
								puts caseinfo.invtermdate
							#Published Commission Opinions
							caseinfo.publishopinion = subpage.css('tr:nth-child(21) font').text
								puts caseinfo.publishopinion
							#Related Court Decisions
							caseinfo.relatedcourtdecision = subpage.css('tr:nth-child(22) font').text
								puts caseinfo.relatedcourtdecision
							#Appeal Status/Result
							caseinfo.appealstatus = subpage.css('tr:nth-child(23) font').text
								puts caseinfo.appealstatus
							#Disposition
							caseinfo.disposition = subpage.css('table:nth-child(5) tr:nth-child(2) td:nth-child(2)').text
								puts caseinfo.disposition
							#Unfair Acts Found
							caseinfo.unfairactsfound = subpage.css('table:nth-child(5) tr:nth-child(3) td:nth-child(2)').text
								puts caseinfo.unfairactsfound
							#Notes  Re: Disposition/Remedy
							caseinfo.notes = subpage.css('table:nth-child(5) tr:nth-child(4) td:nth-child(2)').text
								puts caseinfo.notes
							#Active/Expired Remedial Order
							caseinfo.activeexpiredremedial = subpage.css('table:nth-child(5) tr:nth-child(5) td:nth-child(2)').text
								puts caseinfo.activeexpiredremedial
							#Exlusion/C&D Orders
							caseinfo.exclusioncdorders = subpage.css('table:nth-child(5) tr:nth-child(6) td:nth-child(2)').text
								puts caseinfo.exclusioncdorders
							#Target Date
							caseinfo.targetdate = subpage.css('table:nth-child(6) tr:nth-child(2) td:nth-child(2)').text
								puts caseinfo.targetdate
							#Violation Final ID Due Date
							caseinfo.violationfinalduedate = subpage.css('table:nth-child(6) tr:nth-child(3) td:nth-child(2)').text
								puts caseinfo.violationfinalduedate
							#Beginning and Ending Dates of Evidentary Hearing
							caseinfo.beginenddates = subpage.css('table:nth-child(6) tr:nth-child(4) td:nth-child(2)').text
								puts caseinfo.beginenddates
							#Archivist
							caseinfo.archivist = subpage.css('div:nth-child(2)').text
								puts caseinfo.archivist
							# Save Case info record.
							caseinfo.save
				end	   
			end
			# Use mechanize agent to click the next page link set the nokogiri url to the new page. Then push the add to i count.
			next_page = agent.click(page.at('td:nth-child(4) a')).uri.to_s
			puts next_page
			url = next_page
			# Put notification that the next link has been clicked.
			puts ("Clicked Link")
			# Increments i.
			i = i + 1
		end
	end	
end
