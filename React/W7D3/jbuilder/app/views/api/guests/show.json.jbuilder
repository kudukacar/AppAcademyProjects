json.partial! './api/guests/guest', guest: @guest
json.set! 'gifts' do
    json.array! @guest.gifts do |gift|
        json.id gift.id
    end
end