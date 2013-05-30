# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'dipnlik', password: 'simple password', password_confirmation: 'simple password')

# app should be able to scale to 50 users and 1000 books
print "Creating users "
(1..50).each do |i|
  User.create(username: "user#{i}", password: 'dummy', password_confirmation: 'dummy')
  print '.'
end

puts

print "Creating books "
(1..1000).each do |i|
  Book.create(title: "Book ##{"%04d" % i}", isbn: ("%010d" % i))
  print '.'
end

puts

module ActiveRecord
  class Base
    def self.random
      if (c = count) != 0
        find(:first, offset: rand(c))
      end
    end
  end
end

print "Creating random ratings "
(1..200).each do |i|
  book = Book.random
  Kernel.rand(10).times do
    Rating.create(book_id: book.id, user_id: User.random.id, value: Kernel.rand(6).to_f)
    print '.'
  end
end
