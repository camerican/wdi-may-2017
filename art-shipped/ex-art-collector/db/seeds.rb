# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Artist.create([
  {
    name: "Edmond Aman-Jean",
    bio: "Bonjour, mon ami.  Je suis un painteur n'est pas? Bof",
    dob: 1858-01-13,
    dod: 1936-01-25
  },
  {
    name: "Eugène Emmanuel Amaury Duval",
    bio: "L'ennyui est trop forte pour moi.",
    dob: 1808-04-16,
    dod: 1885-12-25
  },
  {
    name: "Albert André",
    bio: "Zut",
    dob: 1869-05-24,
    dod: 1954-07-11
  }
])

Artwork.create([
  {
    name: "Miss Ella Carmichaël",
    artist_id: 1,
    completed_at: 1906-01-01
  }
])

Keyword.create!([
  # {
  #   name: "style"
  # },
  # {
  #   name: "nationality"
  # },
  {
    # parent_id: Keyword.find_by(name: "style"), 
    name: "symbolism",
    category: :style
  },
  { 
    # parent_id: Keyword.find_by(name: "nationality"),
    name: "french",
    category: :nationality
  },
  {
    name: "painting",
    category: :medium
  },
  {
    name: "pottery",
    category: :medium
  },
  {
    name: "sculpture",
    category: :medium
  }
])

ArtworkKeyword.create([
  {
    keyword_id: 1, 
    artwork_id: 1
  },
  {
    keyword_id: 2, 
    artwork_id: 1
  }
])
