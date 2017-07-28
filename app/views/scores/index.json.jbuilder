json.array!(@scores) do |score|
  json.extract! score, :id, :name, :score_type_id, :user_id, :state, :published, :points, :average, :x_count, :ten_count, :nine_count
  json.url score_url(score, format: :json)
end
