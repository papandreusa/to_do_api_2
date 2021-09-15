class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :task, index: true, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
