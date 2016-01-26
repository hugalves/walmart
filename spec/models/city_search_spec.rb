require 'rails_helper'

describe CitySearch do
  let!(:city)   { create(:city) }
  let(:origin)  { 'A' }
  let(:destiny) { 'E' }
  let(:search)  { CitySearch.new(city.id, origin, destiny) }

  let!(:citymap1) { CityMap.create(city_id: city.id, origin: 'A', destiny: 'B', distance: 10) }
  let!(:citymap2) { CityMap.create(city_id: city.id, origin: 'B', destiny: 'D', distance: 15) }
  let!(:citymap3) { CityMap.create(city_id: city.id, origin: 'A', destiny: 'C', distance: 20) }
  let!(:citymap4) { CityMap.create(city_id: city.id, origin: 'C', destiny: 'D', distance: 30) }
  let!(:citymap5) { CityMap.create(city_id: city.id, origin: 'B', destiny: 'E', distance: 50) }
  let!(:citymap6) { CityMap.create(city_id: city.id, origin: 'D', destiny: 'E', distance: 30) }

  describe '#lowest_distance' do
    subject { search.lowest_distance }

    context 'having routes' do
      it 'does return 55' do
        expect(subject).to eq 55
      end
    end

    context 'not having routes' do
      let(:destiny) { 'Z' }

      it 'does return nil' do
        expect(subject).to eq nil
      end
    end
  end
end
