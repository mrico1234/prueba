class AddClientIdToOrdens < ActiveRecord::Migration[5.1]
  def change
    add_reference :ordens, :client, foreign_key: true
  end
end
