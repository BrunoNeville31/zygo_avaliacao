//= require select2/dist/js/select2.min.js

$('.js-example-disabled').select2({
    placeholder: 'Encontre seu Livro',
    language: "es",
    theme: "classic"
});

function searchbook(){
    $("#form-search-book").submit();
}