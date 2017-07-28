json.array!(@arrows) do |arrow|
  json.extract! arrow, :id, :score_id, :value
  json.url arrow_url(arrow, format: :json)
end
