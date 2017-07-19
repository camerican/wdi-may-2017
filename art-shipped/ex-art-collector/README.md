

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