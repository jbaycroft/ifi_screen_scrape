json.array!(@patentnos) do |patentno|
  json.extract! patentno, :id, :patno
  json.url patentno_url(patentno, format: :json)
end
