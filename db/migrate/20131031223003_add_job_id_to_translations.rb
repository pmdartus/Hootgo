class AddJobIdToTranslations < ActiveRecord::Migration
  def change
    add_column :translations, :job_id, :integer
  end
end
