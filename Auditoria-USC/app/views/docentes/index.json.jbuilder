json.array!(@docentes) do |docente|
  json.extract! docente, :id, :nombre, :identificacion
  json.url docente_url(docente, format: :json)
end
