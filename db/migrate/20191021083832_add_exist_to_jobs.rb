class AddExistToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :exist, :string
  end
end
