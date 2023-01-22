let input = document.getElementById("nitrogeno");
input.oninput = mostrarValorInput
function mostrarValorInput() {
    let inputValue = input.value;
    if (inputValue < 0.05) {
        document.getElementById("miDiv").innerHTML = "Muy bajo";
    } else if (inputValue >= 0.05 && inputValue < 0.20) {
        document.getElementById("miDiv").innerHTML = "Bajo";
    } else if (inputValue >= 0.20 && inputValue < 0.40) {
        document.getElementById("miDiv").innerHTML = "Su valor esta en un nivel medio consideramos no aportar mas";
    } else if (inputValue >= 0.40 && inputValue < 0.60) {
        document.getElementById("miDiv").innerHTML = "Alto";
    } else if (inputValue >= 0.60 && inputValue >= 0.1) {
        document.getElementById("miDiv").innerHTML = "Muy alto";
    }
}
const fosforo = document.getElementById("fosforo");
fosforo.oninput = validarParametros
function validarParametros() {
    const valor = fosforo.value;
    if (valor === "") {
        document.getElementById("DivFosforo").innerHTML = "Muy bajo";
    } else if (valor >= 0.05 && valor <= 0.15) {
        document.getElementById("DivFosforo").innerHTML = "Bajo";
    } else if (valor >= 16 && valor <= 30) {
        document.getElementById("DivFosforo").innerHTML = "Medio";
    } else if (valor >= 0.30) {
        document.getElementById("DivFosforo").innerHTML = "Alto";
    } else if (valor === "") {
        document.getElementById("DivFosforo").innerHTML = "Muy alto";
    }

}
const Potasio = document.getElementById("Potasio");
Potasio.oninput = validarParametrosPotasio
function validarParametrosPotasio() {
    const valor = Potasio.value;
    if (valor < 30) {
        document.getElementById("DivPotasio").innerHTML = "Muy bajo";
    } else if (valor >= 30 && valor <= 100) {
        document.getElementById("DivPotasio").innerHTML = "Bajo";
    } else if (valor >= 100 && valor <= 160) {
        document.getElementById("DivPotasio").innerHTML = "Medio";
    } else if (valor >= 160 && valor <= 350) {
        document.getElementById("DivPotasio").innerHTML = "Alto";
    } else if (valor > 350) {
        document.getElementById("DivPotasio").innerHTML = "Muy alto";
    }

}
const Magnesio = document.getElementById("Magnesio");
Magnesio.oninput = validarParametrosMagnesio
function validarParametrosMagnesio() {
    const valor = Magnesio.value;
    if (valor < 0.30) {
        document.getElementById("DivMagnesio").innerHTML = "Muy bajo";
    } else if (valor >= 0.30 && valor <= 1.0) {
        document.getElementById("DivMagnesio").innerHTML = "Bajo";
    } else if (valor >= 1.0 && valor <= 3.0) {
        document.getElementById("DivMagnesio").innerHTML = "Medio";
    } else if (valor >= 3.0 && valor <= 8.0) {
        document.getElementById("DivMagnesio").innerHTML = "Alto";
    } else if (valor > 8) {
        document.getElementById("DivMagnesio").innerHTML = "Muy alto";
    }

}
const Calcio = document.getElementById("Calcio");
Calcio.oninput = validarParametrosCalcio
function validarParametrosCalcio() {
    const valor = Calcio.value;
    if (valor < 2) {
        document.getElementById("DivCalcio").innerHTML = "Muy bajo";
    } else if (valor >= 2.0 && valor <= 5.0) {
        document.getElementById("DivCalcio").innerHTML = "Bajo";
    } else if (valor >= 5.0 && valor <= 10.0) {
        document.getElementById("DivCalcio").innerHTML = "Medio";
    } else if (valor >= 10 && valor <= 20) {
        document.getElementById("DivCalcio").innerHTML = "Alto";
    } else if (valor > 20) {
        document.getElementById("DivCalcio").innerHTML = "Muy alto";
    }

}
const sodio = document.getElementById("sodio");
sodio.oninput = validarParametrossodio
function validarParametrossodio() {
    const valor = sodio.value;
    if (valor < 0.1) {
        document.getElementById("DivSodio").innerHTML = "Muy bajo";
    } else if (valor >= 0.1 && valor <= 0.3) {
        document.getElementById("DivSodio").innerHTML = "Bajo";
    } else if (valor >= 0.3 && valor <= 0.7) {
        document.getElementById("DivSodio").innerHTML = "Medio";
    } else if (valor >= 0.7 && valor <= 2) {
        document.getElementById("DivSodio").innerHTML = "Alto";
    } else if (valor > 2) {
        document.getElementById("DivSodio").innerHTML = "Muy alto";
    }

}
const Hierro = document.getElementById("Hierro");
Hierro.oninput = validarParametrosHierro
function validarParametrosHierro() {
    const valor = Hierro.value;
    if (valor < 4.0) {
        document.getElementById("DivHierro").innerHTML = "Muy bajo";
    } else if (valor >= 4.0 && valor <= 20.0) {
        document.getElementById("DivHierro").innerHTML = "Bajo";
    } else if (valor >= 20 && valor <= 100) {
        document.getElementById("DivHierro").innerHTML = "Medio";
    } else if (valor >= 100 && valor <= 200) {
        document.getElementById("DivHierro").innerHTML = "Alto";
    } else if (valor > 200) {
        document.getElementById("DivHierro").innerHTML = "Muy alto";
    }

}
const Manganeso = document.getElementById("Manganeso");
Manganeso.oninput = validarParametrosManganeso
function validarParametrosManganeso() {
    const valor = Manganeso.value;
    if (valor < 2.0) {
        document.getElementById("DivManganeso").innerHTML = "Muy bajo";
    } else if (valor >= 2.0 && valor <= 10.0) {
        document.getElementById("DivManganeso").innerHTML = "Bajo";
    } else if (valor >= 10.0 && valor <= 50.0) {
        document.getElementById("DivManganeso").innerHTML = "Medio";
    } else if (valor >= 50.0 && valor <= 100) {
        document.getElementById("DivManganeso").innerHTML = "Alto";
    } else if (valor > 100) {
        document.getElementById("DivManganeso").innerHTML = "Muy alto";
    }
}
const Zinc = document.getElementById("Zinc");
Zinc.oninput = validarParametrosZinc
function validarParametrosZinc() {
    const valor = Zinc.value;
    if (valor < 1.0) {
        document.getElementById("DivZinc").innerHTML = "Muy bajo";
    } else if (valor >= 1.0 && valor <= 2.0) {
        document.getElementById("DivZinc").innerHTML = "Bajo";
    } else if (valor >= 2.0 && valor <= 5.0) {
        document.getElementById("DivZinc").innerHTML = "Medio";
    } else if (valor >= 5.0 && valor <= 20) {
        document.getElementById("DivZinc").innerHTML = "Alto";
    } else if (valor > 20) {
        document.getElementById("DivZinc").innerHTML = "Muy alto";
    }
}
const Cobre = document.getElementById("Cobre");
Cobre.oninput = validarParametrosCobre
function validarParametrosCobre() {
    const valor = Cobre.value;
    if (valor < 0.50) {
        document.getElementById("DivCobre").innerHTML = "Muy bajo";
    } else if (valor >= 0.50 && valor <= 1.25) {
        document.getElementById("DivCobre").innerHTML = "Bajo";
    } else if (valor >= 1.25 && valor <= 2.50) {
        document.getElementById("DivCobre").innerHTML = "Medio";
    } else if (valor >= 2.50 && valor <= 5.0) {
        document.getElementById("DivCobre").innerHTML = "Alto";
    } else if (valor > 5.0) {
        document.getElementById("DivCobre").innerHTML = "Muy alto";
    }
}