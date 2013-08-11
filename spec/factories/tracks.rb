# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :track do
    title "Black Hole Sun"
    artist "R. Kelly"
    midi_file File.open(File.join(Rails.root, 'spec/fixtures/files/test.mid'))

    association :user
  end
end
