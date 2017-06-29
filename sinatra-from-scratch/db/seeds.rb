# seeds.rb
# Create our users
User.create([
  {id: 1, first_name: 'Hans', last_name: 'Palacios', email: 'hans@mrperfect.com', password: 'duckduckgoose'},
  {id: 2, first_name: 'James', last_name: 'Lim', email: 'james@bond.com', password: 'shakennotstirred'},
  {id: 3, first_name: 'Neil', last_name: 'Parsa', email: 'neil@parsa.net', password: 'neilneil'},
  {id: 4, first_name: 'Logan', last_name: 'Baker', email: 'logan@animalhospital.org', password: 'password'},
  {id: 5, first_name: 'David', last_name: 'Zheng', email: 'dennis@itsalwayssunny.com', password: '134><DFNAL!#$3'},
  {id: 6, first_name: 'Victor', last_name: 'Ganda', email: 'Victor@liverpoolfc.com', password: 'manusucks'},
  {id: 7, first_name: 'Erin', last_name: 'Young', email: 'erin@young.com', password: 'westvirginiaisthebestvirginia'},
  {id: 8, first_name: 'Steven', last_name: 'Velez-Garcia', email: 'steven@steven.com', password: '#!$kldfalk2343'},
  {id: 9, first_name: 'Katy', last_name: 'Pola', email: 'katy@pola.com', password: 'paperpaper'},
  {id: 10, first_name: 'Julia', last_name: 'Kopyeva', email: 'julia@k.ru', password: 'designsbyjulia'},
  {id: 11, first_name: 'Nick', last_name: 'Fehlinger', email: 'nick@lodeon.com', password: 'supersecret'}
])
# posts
Post.create([
  {user_id: 4, title: 'Ducks are great', body: 'Ducks are the best pets to operate on.  They love bread, so they always have money to pay on time.'},
  {user_id: 11, title: 'Johnny Nmemonic is the Greatest Movie of our time', body: 'Johnny Nmemonic needs his room service.  This tour de fource from Keanu Reeves forever transformed the genre of futuristic action thrillers.  The dolphin hacker single-finnedly convinced me to devote my energy towards attaining its level of sonar coding dominance.  One day I will also fry Dolph Lundgren with the power of my coding abilities.'},
  {user_id: 11, title: 'What is all this?', body: 'This is madness, madness I tell you!'}
])
