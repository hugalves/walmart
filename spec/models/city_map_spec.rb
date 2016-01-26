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
    let(:params) { { name: city.name, origin: 'A', destiny: 'B', distance: 20 } }

    subject { CityMap.build_and_create_with!(params) }

    context 'when successfully' do
      context 'and having city map' do
        before do
          create(:city_map, city_id: city.id)
        end

        it 'does not create city_map' do
          expect { subject }.not_to change{CityMap.count}
        end

        it 'does update distance' do
          subject
          expect(CityMap.first.distance).to eq 20
        end
      end

      context 'and not having city map' do
        it 'does create city_map' do
          expect { subject }.to change{ CityMap.count }.by(1)
        end
      end
    end

    context 'when unsuccessfully' do
      before do
        allow(City).to receive(:find_or_create_by!).and_return(false)
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
