class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|

      t.timestamps
    end
  end
end
