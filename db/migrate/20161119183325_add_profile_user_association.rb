class AddProfileUserAssociation < ActiveRecord::Migration[5.0]
  def change
    add_reference :profiles, :user, index: true 
  end
end
