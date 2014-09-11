require 'prawn/table'
class ReportesController < ApplicationController
  before_action :set_reporte, only: [:show, :edit, :update, :destroy]

  # GET /reportes
  # GET /reportes.json
  def index
    @reportes = Reporte.all
    respond_to do |format|
      format.html
      format.json
      format.csv {send_data @reportes.to_csv}
      format.pdf do
        pdf = ReportPdf.new(@reportes)
        send_data pdf.render, filename: "report_#{Time.now}.pdf", type: 'application/pdf'
      end
    end
  end

  # GET /reportes/1
  # GET /reportes/1.json
  def show

  end

  # GET /reportes/new
  def new
    @reporte = Reporte.new
  end

  # GET /reportes/1/edit
  def edit
  end

  # POST /reportes
  # POST /reportes.json
  def create
    @reporte = Reporte.new(reporte_params)

    respond_to do |format|
      if @reporte.save

        format.html { redirect_to @reporte, notice: 'Reporte was successfully created.' }
        format.json { render :show, status: :created, location: @reporte }
      else
        format.html { render :new }
        format.json { render json: @reporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reportes/1
  # PATCH/PUT /reportes/1.json
  def update
    respond_to do |format|
      if @reporte.update(reporte_params)
        format.html { redirect_to @reporte, notice: 'Reporte was successfully updated.' }
        format.json { render :show, status: :ok, location: @reporte }
      else
        format.html { render :edit }
        format.json { render json: @reporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reportes/1
  # DELETE /reportes/1.json
  def destroy
    @reporte.destroy
    respond_to do |format|
      format.html { redirect_to reportes_url, notice: 'Reporte was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reporte
      @reporte = Reporte.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reporte_params
      params.require(:reporte).permit(:numero_estudiantes, :docente_id, :comentario, :asignatura_id)
    end
end
#-----------------------------------------------------------------------------------------------------------------------
#Clase para Generar PDFs
#-----------------------------------------------------------------------------------------------------------------------
class ReportPdf < Prawn::Document
  def initialize(products)
    super()
    @products = products
    header
    text_content
    table_content
  end

  def header
    #This inserts an image in the pdf file and sets the size of the image
    image "#{Rails.root}/app/assets/images/usclogo.jpg", width: 80, height: 80

    draw_text "Universidad Santiago De Cali", size: 20, style: :bold, :at => [81,695]
    draw_text "Generador de reportes - NotesTest V=1.0", size: 15, :at => [81,680]
    draw_text "Aplicacion creada por:", size: 15, :at => [81,665]
    draw_text "Mateo Aya sobre RoR", size: 15, style: :bold, :at => [230,665]
    draw_text "Software guia para los estudiantes del curso de programacion WEB", size: 12, style: :bold, :at => [65,600]
    draw_text "Espero que esto sea de apoyo y motivacion en su proceso de aprendizaje", size: 12, style: :bold, :at => [55,590]
  end

  def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 90

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 270) do
      text "Listado de reportes", size: 15, style: :bold
    end
    bounding_box([280, y_position], :width => 270) do
      text "Feha: #{Time.now}", size: 10, style: :italic
    end
  end

  def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table product_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']

    end
  end

  def product_rows
    [['Nº Reporte', 'Asignatura','Codigo','Nº Estudiantes', 'Docente','Comentario']] +
        @products.map do |product|
          [product.id, product.asignatura.nombre,product.asignatura.codigo,product.numero_estudiantes, product.docente.nombre,product.comentario]
        end
  end
end


