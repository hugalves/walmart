require 'rails_helper'

describe Route do
  let!(:city)     { create(:city) }
  let(:origin)    { 'A' }
  let(:destiny)   { 'D' }
  let(:search)    { CitySearch.new(city.id, origin, destiny) }
  let(:transport) { Transport.new(10, 2.5) }
  let(:route)     { Route.new(search, transport) }

  let!(:citymap1) { CityMap.create(city_id: city.id, origin: 'A', destiny: 'B', distance: 10) }
  let!(:citymap2) { CityMap.create(city_id: city.id, origin: 'B', destiny: 'D', distance: 15) }
  let!(:citymap3) { CityMap.create(city_id: city.id, origin: 'A', destiny: 'C', distance: 20) }
  let!(:citymap4) { CityMap.create(city_id: city.id, origin: 'C', destiny: 'D', distance: 30) }
  let!(:citymap5) { CityMap.create(city_id: city.id, origin: 'B', destiny: 'E', distance: 50) }
  let!(:citymap6) { CityMap.create(city_id: city.id, origin: 'D', destiny: 'E', distance: 30) }

  describe '#cost' do
    subject { route.cost }

    it 'does return 6.25' do
      expect(subject).to eq 6.25
    end
  end
end
