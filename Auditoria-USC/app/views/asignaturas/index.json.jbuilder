json.array!(@asignaturas) do |asignatura|
  json.extract! asignatura, :id, :nombre, :codigo, :descripcion, :docente_id
  json.url asignatura_url(asignatura, format: :json)
end
