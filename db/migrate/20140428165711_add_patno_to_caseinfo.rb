class AddPatnoToCaseinfo < ActiveRecord::Migration
  def change
    add_column :caseinfos, :patno_key, :string
  end
end
