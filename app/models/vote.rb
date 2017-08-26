class Vote < ApplicationRecord
  belongs_to :post
  counter_culture :post
  counter_culture :post, column_name: "vote_points", delta_column: "point"
end
