namespace :db do
  desc "Recreate data"
  task recreate: ["db:drop", "db:create", "db:migrate"]

  desc "Create a user with 10 posts"
  task create_user_posts: :environment do
    Rails.logger = Logger.new(STDOUT)
    user = User.create name: Faker::Name.name
    10.times do
      Post.create title: Faker::Lorem.sentence, user: user,
        description: Faker::Lorem.paragraph
    end
  end

  desc "Create n votes"
  task :create_vote, [:n_record] => [:environment] do |t, args|
    Rails.logger = Logger.new(STDOUT)
    args[:n_record].to_i.times { Vote.create post_id: 1 }
  end

  desc "Create random vote"
  task create_random_vote: :environment do |t, args|
    Rails.logger = Logger.new(STDOUT)
    Vote.create post_id: 1, point: rand(2..10)
  end

  desc "Create post vote special"
  task :create_post_vote_sp, [:n_record, :post_id] => [:environment] do |t, args|
    Rails.logger = Logger.new(STDOUT)
    n_record = args[:n_record].to_i || 1
    n_record.times { Vote.create post_id: args[:post_id], point: rand(2..10) }
  end
end
