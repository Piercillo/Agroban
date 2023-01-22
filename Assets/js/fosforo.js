let botonf = document.getElementById('calcularFosforo');
let respuestaf = document.getElementById('respuestaFosforo');

botonf.addEventListener('click',fosforoc);

function fosforoc(){
    let n1 = parseFloat(document.getElementById('pesoFosforo').value);
    let n2 = parseFloat(document.getElementById('moFosforo').value);
    let p= (((((((((n1*n2)*1)/1000000)*142)/62)-60)*1)*100)/46);
    respuestaf.innerHTML= `La cantidad de fósforo que deberia usar es ${p} Kg`;
}
