class AddCompanyEmailToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :company_email, :string
  end
end
