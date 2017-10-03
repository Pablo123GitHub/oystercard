require 'station'
describe Station do
  let (:station) {Station.new(name: "Moorgate", zone: 1)}
  it 'expects to give the zone related to the station' do
    expect(station.zone).to eq 1
  end
  it 'expects to give the zone related to the station' do
    expect(station.name).to eq 'Moorgate'
  end
end
