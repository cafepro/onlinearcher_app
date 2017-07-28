json.array!(@score_types) do |score_type|
  json.extract! score_type, :id, :score_id, :name, :arrows, :distance_1, :distance_2, :distance_3, :distance_4, :published
  json.url score_type_url(score_type, format: :json)
end
