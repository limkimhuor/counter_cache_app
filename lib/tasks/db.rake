namespace :db do
  desc "Recreate data"
  task recreate: ["db:drop", "db:create", "db:migrate"]

  desc "Create 10 posts"
  task create_posts: :environment do
    Rails.logger = Logger.new(STDOUT)
    10.times { Post.create title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph}
  end

  desc "Create n votes"
  task :create_vote, [:n_record] => [:environment] do |t, args|
    Rails.logger = Logger.new(STDOUT)
    n_record.to_i.times { Vote.create post_id: 1, point: point }
  end

  desc "Create random vote"
  task create_random_vote: :environment do |t, args|
    Rails.logger = Logger.new(STDOUT)
    Vote.create post_id: 1, point: rand(2..10)
  end

  desc "Create post vote special"
  task :create_post_vote_sp, [:n_record, :post_id, :point] => [:environment] do |t, args|
    Rails.logger = Logger.new(STDOUT)
    n_record = args[:n_record].to_i || 1
    point = args[:point] || rand(2..10)
    n_record.times { Vote.create post_id: args[:post_id], point: point }
  end
end
