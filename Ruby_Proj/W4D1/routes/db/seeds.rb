# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Artwork.create(title: 'Mona Lisa', artist_id: 9)
Artwork.create(title: 'The Scream', artist_id: 10)
Artwork.create(title: 'Lillies on the Water', artist_id: 11)
Artwork.create(title: 'Ballerinas', artist_id: 9)
Artwork.create(title: 'Pieta', artist_id: 9)

ArtworkShare.create(artwork_id: 1, viewer_id: 10)
ArtworkShare.create(artwork_id: 1, viewer_id: 11)
ArtworkShare.create(artwork_id: 2, viewer_id: 9)

