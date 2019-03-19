class CreateRequisitions < ActiveRecord::Migration[5.1]
  def change
    create_table :requisitions do |t|

      t.timestamps
    end
  end
end
