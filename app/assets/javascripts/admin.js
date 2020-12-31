//= require apexcharts/dist/apexcharts.min.js
//= require datatables.net/js/jquery.dataTables.min.js
//= require datatables.net-bs4/js/dataTables.bootstrap4.min.js
//= require datatables.net-responsive/js/dataTables.responsive.min.js
//= require datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js
//= require form-validation.init.js
//= require parsley.min.js
//= require trix


$(document).ready(        
    function(){   
        // View bookshelf index         
        $("#datatable").DataTable({
            "language": {
                "lengthMenu": "Exibir _MENU_ registro por páginas",                
                "info": "Exibindo página _PAGE_ de _PAGES_",
                "infoEmpty": "Não foram encontrados registros",
                "infoFiltered": "",
                "search": "Buscar:",                
                "paginate": {
                    "first": "Primeira",
                    "last": "Última",
                    "next": "Proxima",
                    "previous": "Anterior"
                },
                "loadingRecords": "Carregando...",
                "processing": "Processando...",
                "zeroRecords": "Sem registros compatíveis"
            }
        })
        // View bookshelf new
        $("#AnexImagem").click(function(){
            $("#validationImage").click()
        });

    } 
);  

// View bookshelf new
document.getElementById("validationImage").addEventListener("change", readImage, false);

function readImage(){

    if (this.files && this.files[0]) {
        var file = new FileReader();
        file.onload = function(e) {
            document.getElementById("preview-img").src = e.target.result;
            document.getElementById("nameImage").textContent = document.getElementById('validationImage').value
        };       
        file.readAsDataURL(this.files[0]);
    }
}