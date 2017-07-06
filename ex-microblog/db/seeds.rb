User.create([
  {fname: 'Cam',lname: 'Crews',email: 'cam@nycda.com', password: 'boo', status: :active},
  {fname: 'Victor',lname: 'Ganda',email: 'v@ganda.com', password: 'boo', status: :active}
])
Post.create([
  {title: 'My first post', body: 'Isn\'t this wonderful?', user_id: 1, is_published: true},
  {title: 'Not impressed', body: 'I\'ve seen better.', user_id: 2, is_published: true}
])