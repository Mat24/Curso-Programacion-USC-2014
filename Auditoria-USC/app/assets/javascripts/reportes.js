$(function() {
    //Cuando carga la pagina, carga los blogs
    //Boton de actualizar lista

    $( "#reporte_asignatura_id" )
        .change(function () {
            getAsignaturaID();
        })
        .change();
});

function startRefresh() {
    setTimeout(startRefresh,1000);
}
function getAsignaturaID(){
    id = $("#reporte_asignatura_id").val();
    console.log("Obteninedo datos");
    $.getJSON("/asignaturas/"+id+".json",function(data){
        console.log("Datos obtenidos:",data);
        $("#reporte_codigo_asignatura").val(data.codigo)
    });
}
