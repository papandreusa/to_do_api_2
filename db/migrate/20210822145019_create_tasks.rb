class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.integer :position, default: 0, null: false
      t.date :due_date, default: nil
      t.boolean :done, default: false, null: false
      t.belongs_to :project, index: true, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
