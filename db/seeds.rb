Feed.create(category: 'Ruby on Rails') unless Feed.find_by(category: 'Ruby on Rails')
Feed.create(category: 'HTML / CSS') unless Feed.find_by(category: 'HTML / CSS')
Feed.create(category: 'JavaScript') unless Feed.find_by(category: 'JavaScript')
Feed.create(category: 'PHP') unless Feed.find_by(category: 'PHP')
Feed.create(category: 'Python') unless Feed.find_by(category: 'Python')
Feed.create(category: 'Cake') unless Feed.find_by(category: 'Cake')
Feed.create(category: 'Java') unless Feed.find_by(category: 'Java')
Feed.create(category: 'ReactJS') unless Feed.find_by(category: 'ReactJS')

puts 'Feeds Seeded'
