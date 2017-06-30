# seeds.rb
Cohort.create([
  name: 'Tunesquad', description: 'WDI May 2017 NYC',
  name: 'TBD', description: 'WDI July 2017 NYC'
])
User.create([
  {first_name: 'Julia', last_name: 'Kopyeva', slack_username: 'jakjak', cohort_id: 1},
  {first_name: 'James', last_name: 'Lim', slack_username: 'jameslim', cohort_id: 1},
  {first_name: 'Erin', last_name: 'Young', slack_username: 'erinkarlayoung', cohort_id: 1},
  {first_name: 'Katy', last_name: 'Pola', slack_username: 'katypola', cohort_id: 1},
  {first_name: 'Neil', last_name: 'Parsa', slack_username: 'geffern', cohort_id: 1},
  {first_name: 'David', last_name: 'Zheng', slack_username: 'davidzheng', cohort_id: 1},
  {first_name: 'Victor', last_name: 'Ganda', slack_username: 'gsta', cohort_id: 1},
  {first_name: 'Hans', last_name: 'Palacios', slack_username: 'hanspalacios', cohort_id: 1},
  {first_name: 'Logan', last_name: 'Baker', slack_username: 'lobaker13', cohort_id: 1},
  {first_name: 'Steven,', last_name: 'Velez-Garcia', slack_username: 'jakjak', cohort_id: 1},
  {first_name: 'Nick', last_name: 'Fehlinger', slack_username: 'nickfehlinger', cohort_id: 1},
  {first_name: 'Malik', last_name: 'Pervez', cohort_id: 2},
  {first_name: 'Success', last_name: 'Uwuigbe', cohort_id: 2},
  {first_name: 'Richard', last_name: 'Love', cohort_id: 2},
  {first_name: 'Jason', last_name: 'Surko', cohort_id: 2},
  {first_name: 'Daniel', last_name: 'Ramalho', cohort_id: 2},
  {first_name: 'Leighton', last_name: 'Lee', cohort_id: 2},
  {first_name: 'Randall', last_name: 'Song', cohort_id: 2},
  {first_name: 'Wesley', last_name: 'Stuckmeyer', cohort_id: 2}
])