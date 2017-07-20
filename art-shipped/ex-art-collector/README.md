

# Build Steps

```
rails new ex-art-collector
cd ex-art-collector
rails g scaffold artist name:string bio:text dob:datetime dod:datetime
rails g scaffold artwork name:string artist:belongs_to completed_at:datetime status:integer
rails g resource keyword name:string parent:belongs_to 
rails g migration artwork_keyword_join
```



ref: https://stackoverflow.com/questions/17765249/generate-migration-create-join-table

generate migration for the join table

ref: https://stackoverflow.com/questions/9673484/is-there-a-way-to-generate-a-rails-scaffold-without-the-views

# rails g resource Foo bar:text
rails g scaffold_controller Foo --skip-template-engine


Artwork.joins("INNER JOIN artwork_keywords ON artworks.id = artwork_keywords.artwork_id INNER JOIN keywords ON artwork_keywords.keyword_id = keywords.id WHERE 0 OR keywords.name = 'impressionist' OR keywords.name = 'symbolism'").distinct


ar_base = Artwork.joins("INNER JOIN artwork_keywords ON artworks.id = artwork_keywords.artwork_id INNER JOIN keywords ON artwork_keywords.keyword_id = keywords.id")

search_terms = ["symbolism", "impressionism", "textile", "sculpture"]

search_terms.each 









