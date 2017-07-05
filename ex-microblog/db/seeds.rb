User.create([
  {fname: 'Cam',lname: 'Crews',email: 'cam@nycda.com', password: 'boo'},
  {fname: 'Victor',lname: 'Ganda',email: 'v@ganda.com', password: 'boo'}
])
Post.create([
  {title: 'My first post', body: 'Isn\'t this wonderful?', user_id: 1},
  {title: 'Not impressed', body: 'I\'ve seen better.', user_id: 2}
])