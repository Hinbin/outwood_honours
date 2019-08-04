# frozen_string_literal: true

FactoryBot.define do
  factory :badge do
    sequence(:name) { |n| FFaker::HipsterIpsum.words(2).join(' ') + n.to_s }
    sequence(:external_id)
    category
    awarder
    criteria { FFaker::HipsterIpsum.sentence }
    inner_colour { rand(0..13) }
    icon_colour { rand(0..13) }
    icon { %w[vial vials bell exclamation play lemon hotdog ice-cream fish blog blogger blogger-b bluetooth bluetooth-b bold bolt bomb bone bong book book-dead book-medical book-open book-reader bookmark bookmark bootstrap border-all border-none border-style bowling-ball box box-open boxes braille brain bread-slice briefcase briefcase-medical broadcast-tower broom brush buffer bug building building bullhorn bullseye burn buromobelexperte bus].sample }
    banner { FFaker::HipsterIpsum.word.first(11) }
    level { rand(1..3) }
  end
end
