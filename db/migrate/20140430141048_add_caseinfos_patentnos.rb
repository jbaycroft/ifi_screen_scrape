class AddCaseinfosPatentnos < ActiveRecord::Migration
  def self.up
  	create_table :caseinfos_patentnos, :id => false do |t|
  		t.integer :caseinfo_id
  		t.integer :patentno_id
  	end
  end
  def self.down
  	drop_table :caseinfos_patentnos
  end
end
