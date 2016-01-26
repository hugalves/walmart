require 'rails_helper'

describe City do
  let(:city) { create(:city) }

  describe '.fetch_save_return!' do
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
end
