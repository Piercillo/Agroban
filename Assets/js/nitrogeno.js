let botonn = document.getElementById('calcularNitrogeno');
let respuestan = document.getElementById('respuestaNitrogeno');

botonn.addEventListener('click',nitrogeno);

function nitrogeno(){
    let n1 = parseFloat(document.getElementById('pesoNitrogeno').value);
    let n2 = parseFloat(document.getElementById('moNitrogeno').value);
    let p= ((300-((((((n1*n2)/100)*0.05)*1)*0.02)*1))*100)/46;
    respuestan.innerHTML= `La cantidad de nitrogeno a usar son ${p} Kg`;
}