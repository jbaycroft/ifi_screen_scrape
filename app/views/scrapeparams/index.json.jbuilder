json.array!(@scrapeparams) do |scrapeparam|
  json.extract! scrapeparam, :id, :url, :pages
  json.url scrapeparam_url(scrapeparam, format: :json)
end
