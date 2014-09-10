json.array!(@reportes) do |reporte|
  json.extract! reporte, :id, :numero_estudiantes, :docente_id, :comentario
  json.url reporte_url(reporte, format: :json)
end
