class Addbasictables < ActiveRecord::Migration
  def change
    create_table 'cities' do |t|
      t.string 'name'
    end

    create_table 'city_maps' do |t|
      t.integer 'city_id'
      t.string  'origin'
      t.string  'destiny'
      t.float   'distance'
    end
  end
end
