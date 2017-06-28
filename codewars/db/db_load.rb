# We'll refresh our database with the base user set

# delete the database
`rm codewars.db`
# rebuild the database
`sqlite3 codewars.db < schema.sql`
# load our users
`sqlite3 codewars.db < seeds.sql`

