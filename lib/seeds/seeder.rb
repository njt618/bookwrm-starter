module Seeds
  class Seeder
    class << self
      NUM_USERS = 3
      NUM_AUTHORS = 10

      def seed
        puts 'cleaning old data...'
        clean_db
        puts 'creating users...'
        create_users
        puts 'creating authors and books...'
        create_authors_and_books
        puts 'adding favorites and reviews...'
        create_favorites
        create_reviews
        puts 'done'
      end

      private

      def clean_db
        tables.each { |table| table.constantize.destroy_all }
      end

      def tables
        %w(Favorite Review Book Author User)
      end

      def create_users
        users_arr = Array.new(NUM_USERS) do |n|
          {
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.first_name,
            email: "user_#{n}@example.com",
            password: 'password',
            password_confirmation: 'password'
          }
        end
        @users = User.create!(users_arr)
      end

      # rubocop:disable Metrics/MethodLength
      def create_authors_and_books
        authors_arr = [
          {
            first_name: 'William',
            last_name: 'Golding',
            books_attributes: [{
              title: 'Lord of the Flies',
              description: Faker::Lorem.paragraph(1),
              isbn: '0140283331',
              publish_date: Date.new(1954, 9, 17),
              num_pages: 182,
              image_url: 'https://images.gr-assets.com/books/1327869409l/7624.jpg'
            }]
          },
          {
            first_name: 'F. Scott',
            last_name: 'Fitzgerald',
            books_attributes: [{
              title: 'The Great Gatsby',
              description: Faker::Lorem.paragraph(1),
              isbn: '0140283331',
              publish_date: Date.new(1925, 4, 10),
              num_pages: 180,
              image_url: 'https://images.gr-assets.com/books/1490528560l/4671.jpg'
            }]
          },
          {
            first_name: 'George',
            last_name: 'Orwell',
            books_attributes: [{
              title: '1984',
              description: Faker::Lorem.paragraph(1),
              publish_date: Date.new(1949, 6, 8),
              num_pages: 237,
              image_url: 'https://images.gr-assets.com/books/1532714506l/40961427.jpg'
            }]
          },
          {
            first_name: 'J.D.',
            last_name: 'Salinger',
            books_attributes: [{
              title: 'The Catcher in the Rye',
              description: Faker::Lorem.paragraph(1),
              isbn: '0316769177',
              publish_date: Date.new(1951, 7, 16),
              num_pages: 277,
              image_url: 'https://images.gr-assets.com/books/1398034300l/5107.jpg'
            }]
          },
          {
            first_name: 'Nathaniel',
            last_name: 'Hawthorne',
            books_attributes: [{
              title: 'The Scarlet Letter',
              description: Faker::Lorem.paragraph(1),
              isbn: '0142437263',
              publish_date: Date.new(1850, 3, 16),
              num_pages: 238,
              image_url: 'https://images.gr-assets.com/books/1404810944l/12296.jpg'
            }]
          },
          {
            first_name: 'Harper',
            last_name: 'Lee',
            books_attributes: [{
              title: 'To Kill a Mockingbird',
              description: Faker::Lorem.paragraph(1),
              isbn: '0061120081',
              publish_date: Date.new(1960, 7, 11),
              num_pages: 324,
              image_url: 'https://images.gr-assets.com/books/1361975680l/2657.jpg'
            }]
          },
          {
            first_name: 'William',
            last_name: 'Shakespeare',
            books_attributes: [{
              title: 'Romeo and Juliet',
              description: Faker::Lorem.paragraph(1),
              isbn: '0743477111',
              publish_date: Date.new(1597, 1, 1),
              num_pages: 283,
              image_url: 'https://images.gr-assets.com/books/1327872146l/18135.jpg'
            }]
          },
          {
            first_name: 'John',
            last_name: 'Steinbeck',
            books_attributes: [{
              title: 'Of Mice and Men',
              description: Faker::Lorem.paragraph(1),
              isbn: '0142000671',
              publish_date: Date.new(1937, 1, 1),
              num_pages: 112,
              image_url: 'https://images.gr-assets.com/books/1327872146l/18135.jpg'
            }]
          },
          {
            first_name: 'Aldous',
            last_name: 'Huxley',
            books_attributes: [{
              title: 'Brave New World',
              description: Faker::Lorem.paragraph(1),
              isbn: '0060929871',
              publish_date: Date.new(1998, 9, 1),
              num_pages: 288,
              image_url: 'https://images.gr-assets.com/books/1523061131l/5129.jpg'
            }]
          }
        ]
        Author.create!(authors_arr)
      end

      def create_favorites
        @books = Book.all
        favorites_arr = @users.flat_map do |user|
          Array.new(3) do
            {
              user: user,
              book: @books.sample
            }
          end
        end
        Favorite.create!(favorites_arr)
      end

      def create_reviews
        reviews_arr = @users.flat_map do |user|
          Array.new(3) do
            {
              rating: (1..5).to_a.sample,
              description: Faker::Lorem.sentence(3, true, 4),
              user: user,
              book: @books.sample
            }
          end
        end
        Review.create!(reviews_arr)
      end
    end
  end
end
