let boton = document.getElementById('pesosuelo');
let respuesta = document.getElementById('respuestapesosuelo');

boton.addEventListener('click',calcularPeso);

function calcularPeso(){
    let n1 = parseFloat(document.getElementById('profundidad').value);
    let n2 = parseFloat(document.getElementById('densidad').value);
    let p= (((n1/100)*10000)*n2)*1000;
    respuesta.innerHTML= `El peso de su suelo es ${p} Kg`;
}