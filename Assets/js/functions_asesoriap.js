document.write(`<script src="${base_url}/Assets/js/plugins/JsBarcode.all.min.js"></script>`);
let tableProductos;
let rowTable = "";
$(document).on('focusin', function(e) {
    if ($(e.target).closest(".tox-dialog").length) {
        e.stopImmediatePropagation();
    }
});
tableProductos = $('#tableProductos').dataTable( {
    "aProcessing":true,
    "aServerSide":true,
    "language": {
        "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
    },
    "ajax":{
        "url": " "+base_url+"/Asesorias/getAsesorias",
        "dataSrc":""
    },
    "columns":[
        {"data":"idformulariodet"},
        {"data":"formulario"},
        {"data":"pregunta"},
        {"data":"respuesta"},
        {"data":"contenido"},
        { 
            "data": "productos", "render": function (d, t, f) {
                    var html = '';
                    for(var i in d){
                        var ins = d[i];
                        html+= `N°${i*1+1} .-${ins.data.nombre}<br> `;
                    }
                    return html;
                },
                sDefaultContent: "",
                className: 'gradeA',
                "orderable": true
        },
        {"data":"status"},
        {"data":"options"}
    ],
    "columnDefs": [
                    { 'className': "textcenter", "targets": [ 3 ] },
                    { 'className': "textright", "targets": [ 4 ] },
                    { 'className': "textcenter", "targets": [ 5 ] }
                  ],       
    'dom': 'lBfrtip',
    'buttons': [
        {
            "extend": "copyHtml5",
            "text": "<i class='far fa-copy'></i> Copiar",
            "titleAttr":"Copiar",
            "className": "btn btn-secondary",
            "exportOptions": { 
                "columns": [ 0, 1, 2, 3, 4, 5] 
            }
        },{
            "extend": "excelHtml5",
            "text": "<i class='fas fa-file-excel'></i> Excel",
            "titleAttr":"Esportar a Excel",
            "className": "btn btn-success",
            "exportOptions": { 
                "columns": [ 0, 1, 2, 3, 4, 5] 
            }
        },{
            "extend": "pdfHtml5",
            "text": "<i class='fas fa-file-pdf'></i> PDF",
            "titleAttr":"Esportar a PDF",
            "className": "btn btn-danger",
            "exportOptions": { 
                "columns": [ 0, 1, 2, 3, 4, 5] 
            }
        },{
            "extend": "csvHtml5",
            "text": "<i class='fas fa-file-csv'></i> CSV",
            "titleAttr":"Esportar a CSV",
            "className": "btn btn-info",
            "exportOptions": { 
                "columns": [ 0, 1, 2, 3, 4, 5] 
            }
        }
    ],
    "resonsieve":"true",
    "bDestroy": true,
    "iDisplayLength": 10,
    "order":[[0,"desc"]]  
});
window.addEventListener('load', function() {
    $.fn.selectpicker.Constructor.DEFAULTS.multipleSeparator = ',';
    if(document.querySelector("#formProductos")){
        let formProductos = document.querySelector("#formProductos");
        formProductos.onsubmit = function(e) {
            e.preventDefault();
            let strNombre = document.querySelector('#txtNombre').value || '';
            let contenido = document.querySelector('#contenido').value || '';
            let listCategoria = JSON.stringify($('#listCategoria').selectpicker('val')) || '';
            $('#listCategoria2').val(listCategoria);
            let intStatus = document.querySelector('#listStatus').value || '';
            if(strNombre == '' || listCategoria == '' || intStatus == '' )
            {
                swal("Atención", "Todos los campos son obligatorios." , "error");
                return false;
            }
            divLoading.style.display = "flex";
            tinyMCE.triggerSave();
            let request = (window.XMLHttpRequest) ? 
                            new XMLHttpRequest() : 
                            new ActiveXObject('Microsoft.XMLHTTP');

            let ajaxUrl = base_url+'/Asesorias/setAsesoria'; 
            let formData = new FormData(formProductos);
            request.open("POST",ajaxUrl,true);
            request.send(formData);
            request.onreadystatechange = function(){
                if(request.readyState == 4 && request.status == 200){
                    let objData = JSON.parse(request.responseText);
                    if(objData.status)
                    {
                        swal("", objData.msg ,"success");
                        document.querySelector("#idformulariodet").value = objData.idformulariodet;
                        //document.querySelector("#containerGallery").classList.remove("notblock");
                        if(rowTable == ""){
                            tableProductos.api().ajax.reload();
                        }else{
                           //htmlStatus = intStatus == 1 ? 
                            //'<span class="badge badge-success">Activo</span>' : 
                            //'<span class="badge badge-danger">Inactivo</span>';
                            //rowTable.cells[1].textContent = intCodigo;
                            //rowTable.cells[2].textContent = strNombre;
                            //rowTable.cells[3].textContent = intStock;
                            //rowTable.cells[4].textContent = smony+strPrecio;
                           // rowTable.cells[5].innerHTML =  htmlStatus;
                            //rowTable = ""; 
                        }
                            tableProductos.api().ajax.reload();
                    }else{
                        swal("Error", objData.msg , "error");
                    }
                }
                divLoading.style.display = "none";
                return false;
            }
        }
    }

    fntCategorias();
}, false);

tinymce.init({
    selector: '#contenido',
    width: "100%",
    height: 400,    
    statubar: true,
    plugins: [
        "advlist autolink link image lists charmap print preview hr anchor pagebreak",
        "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
        "save table contextmenu directionality emoticons template paste textcolor"
    ],
    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons",
});

function fntEditInfo(element,idformulariodet){
    rowTable = element.parentNode.parentNode.parentNode;
    document.querySelector('#titleModal').innerHTML ="Actualizar Respuesta";
    document.querySelector('.modal-header').classList.replace("headerRegister", "headerUpdate");
    document.querySelector('#btnActionForm').classList.replace("btn-primary", "btn-info");
    document.querySelector('#btnText').innerHTML ="Actualizar";
    let request = (window.XMLHttpRequest) ? 
                    new XMLHttpRequest() : 
                    new ActiveXObject('Microsoft.XMLHTTP');
    let ajaxUrl = base_url+'/Asesorias/getAsesoria/'+idformulariodet;
    request.open("GET",ajaxUrl,true);
    request.send();
    request.onreadystatechange = function(){
        if(request.readyState == 4 && request.status == 200){
            let objData = JSON.parse(request.responseText);
            if(objData.status)
            {
                let htmlImage = "";
                let objProducto = objData.data;
                /**/
                document.querySelector("#idformulariodet").value = objProducto.idformulariodet;
                document.querySelector("#txtNombre").value = objProducto.respuesta;
                //document.querySelector("#contenido").value = objProducto.contenido;
                tinymce.activeEditor.setContent(objProducto.contenido); 
                $('#listCategoria').selectpicker('val', JSON.parse(objProducto.idproducto));

                $('#listStatus').selectpicker('val', objProducto.status);
                //document.querySelector("#listStatus").value = objProducto.status;

                $('#listCategoria').selectpicker('render');
                $('#modalFormProductos').modal('show');
            }else{
                swal("Error", objData.msg , "error");
            }
        }
    }
}

function fntCategorias(){
    if(document.querySelector('#listCategoria')){
        let ajaxUrl = base_url+'/Productos/getSelectProductos';
        let request = (window.XMLHttpRequest) ? 
                    new XMLHttpRequest() : 
                    new ActiveXObject('Microsoft.XMLHTTP');
        request.open("GET",ajaxUrl,true);
        request.send();
        request.onreadystatechange = function(){
            if(request.readyState == 4 && request.status == 200){
                document.querySelector('#listCategoria').innerHTML = request.responseText;
                $('#listCategoria').selectpicker('render');
            }
        }
    }
}