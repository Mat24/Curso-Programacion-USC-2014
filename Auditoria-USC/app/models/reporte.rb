class Reporte < ActiveRecord::Base
  belongs_to :docente
  belongs_to :asignatura

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |reporte|
        csv << reporte.attributes.values_at(*column_names)
      end
    end
  end


end
