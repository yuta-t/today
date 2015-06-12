class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.string :name, default: ""
      t.string :title, default: ""
      t.string :text, default: ""

      t.timestamps
    end
  end
end
