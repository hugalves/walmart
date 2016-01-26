require 'rails_helper'

describe CityMap do
  let(:city) { create(:city) }

  describe '.builder' do
    let(:params)   { { name: city.name, origin: 'A', destiny: 'B', distance:10 } }
    let(:response) { { city_id: city.id, origin: 'A', destiny: 'B', distance:10 } }
    subject { CityMap.builder(city, params) }

    it 'does build builder' do
      expect(subject).to eq response
    end

    it 'does have 4 keys' do
      expect(subject.keys.count).to eq 4
    end
  end

  describe '.routes_to' do
    let(:city_map) { create(:city_map, city_id: city.id) }
    let(:destiny)  { 'B' }

    subject { CityMap.routes_to(city.id, destiny) }

    context 'having routes' do
      it 'does return route' do
        expect(subject).to eq CityMap.routes_to(city.id, 'B')
      end
    end

    context 'not having routes' do
      let(:destiny) { 'C' }

      it 'does return empty' do
        expect(subject).to be_blank
      end
    end
  end

  describe '.route_between' do
    let(:city_map) { create(:city_map, city_id: city.id) }
    let(:destiny)  { 'B' }

    subject { CityMap.route_between(city.id, city_map.origin, destiny) }

    context 'having routes' do
      it 'does return route' do
        expect(subject).to eq CityMap.route_between(city.id, 'A', 'B')
      end
    end

    context 'not having routes' do
      let(:destiny) { 'C' }

      it 'does return empty' do
        expect(subject).to be_blank
      end
    end
  end

  describe '.build_and_create_with!' do
    let(:params) { { name: city.name, origin: 'A', destiny: 'B', distance:10 } }

    subject { CityMap.build_and_create_with!(city, params) }

    context 'when successfully' do
      it 'does create city_map' do
        expect { subject }.to change{ CityMap.count }.by(1)
      end

      it 'does return true' do
        expect(subject).to be_truthy
      end
    end

    context 'when unsuccessfully' do
      before do
        allow(CityMap).to receive(:create!).and_return(false)
      end

      it 'does not create city_map' do
        expect { subject }.not_to change{ CityMap.count }
      end

      it 'does return false' do
        expect(subject).to be_falsey
      end
    end
  end

end
