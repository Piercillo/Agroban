let botonp = document.getElementById('calcularPotasio');
let respuestap = document.getElementById('respuestaPotasio');

botonp.addEventListener('click',potasio);

function potasio(){
    let n1 = parseFloat(document.getElementById('pesoPotasio').value);
    let n2 = parseFloat(document.getElementById('moPotasio').value);
    let p= (((((((((((39/1000)*n1)/0.1)/1000)*n2)*94)/78)-1000)*-1)*100)/60);
    respuestap.innerHTML= `La cantidad de fósforo que deberia usar es ${p} Kg`;
}