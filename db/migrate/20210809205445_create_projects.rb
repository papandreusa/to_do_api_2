class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name, nil: false
      t.belongs_to :user, index: true, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
