class AddDefaultToJobs < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :exist, :string, :default => "Y"
  end
end
