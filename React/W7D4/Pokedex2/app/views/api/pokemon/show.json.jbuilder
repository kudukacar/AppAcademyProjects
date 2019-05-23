json.pokemon do 
    json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type
    json.image_url asset_path(@pokemon.image_url)
    json.item_ids @items_arr
end

json.set! "items" do
    @pokemon.items.each do |item|
        json.set! item.id do
            json.extract! item, :id, :pokemon_id, :name, :price, :happiness, :image_url
        end
    end
end