class CreateMarketingTexts < ActiveRecord::Migration
  def change
    create_table :marketing_texts do |t|
      t.string :text

      t.timestamps
    end
  end
end
