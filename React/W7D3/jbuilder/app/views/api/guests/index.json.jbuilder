json.array! @guests do |guest|
    json.partial! './api/guests/guest', guest: guest
end
    # @guests.each_with_index do |guest, index|
    #     json.set! index do
    #         json.partial! './api/guests/guest', guest: guest
    #     end
    # end