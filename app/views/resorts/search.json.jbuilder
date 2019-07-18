json.resorts do
  json.array!(@resorts) do |resort|
    json.title resort.title
  end
end
