json.array!(@caseinfos) do |caseinfo|
  json.extract! caseinfo, :id, :invno, :itmoc, :uain, :patno, :country, :respondents, :alj, :ouiiattorney, :gcattorney, :statusbeforecommission, :noticeofinv, :proceedtype, :currentphase, :invtermdate, :publishopinion, :relatedcourtdecision, :appealstatus, :disposition, :unfairactsfound, :notes, :activeexpiredremedial, :exclusioncdorders, :targetdate, :violationfinalduedate, :beginenddates, :archivist
  json.url caseinfo_url(caseinfo, format: :json)
end
