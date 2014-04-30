class CreateCaseinfos < ActiveRecord::Migration
  def change
    create_table :caseinfos do |t|
      t.string :invno
      t.string :itmoc
      t.string :uain
      t.string :patno
      t.string :complaint
      t.string :country
      t.string :respondents
      t.string :alj
      t.string :ouiiattorney
      t.string :gcattorney
      t.string :statusbeforecommission
      t.string :noticeofinv
      t.string :proceedtype
      t.string :currentphase
      t.string :invtermdate
      t.string :publishopinion
      t.string :relatedcourtdecision
      t.string :appealstatus
      t.string :disposition
      t.string :unfairactsfound
      t.string :notes
      t.string :activeexpiredremedial
      t.string :exclusioncdorders
      t.string :targetdate
      t.string :violationfinalduedate
      t.string :beginenddates
      t.string :archivist

      t.timestamps
    end
  end
end
