class SeedStaticRoomProperties < ActiveRecord::Migration
  def up
    Room::Property.create(:id => Room::Property::BEAMER, :name => "Beamer")
    Room::Property.create(:id => Room::Property::COMPUTER, :name => "Computerpool")
  end

  def down
    [Room::Property::BEAMER, Room::Property::COMPUTER].each do |id|
      Room::Property.destroy(id)
    end
  end
end
