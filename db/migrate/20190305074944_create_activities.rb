class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.references :action, polymorphic: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
