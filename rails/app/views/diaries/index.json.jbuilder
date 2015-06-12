json.array!(@diaries) do |diary|
  json.extract! diary, :id, :name, :title, :text, :created_at
  json.url diary_url(diary, format: :json)
end
