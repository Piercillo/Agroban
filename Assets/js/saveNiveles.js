const guardar = document.getElementById('guardar-user');
const urls = 'http://localhost/agro/insertarniveles.php';
function cargarEventlistener() {
    guardar.addEventListener('click', guardarN)
}
cargarEventlistener();
function guardarN(e) {
    e.preventDefault();
    const inputNombre = document.getElementById('nitrogeno');
    const valorInputNombre = inputNombre.value;
    if (valorInputNombre < 0.05) {
        document.getElementById("miDiv").innerHTML = "Muy bajo";
    } else if (valorInputNombre >= 0.05 && valorInputNombre < 0.20) {
        document.getElementById("miDiv").innerHTML = "Bajo";
    } else if (valorInputNombre >= 0.20 && valorInputNombre < 0.30) {
        document.getElementById("miDiv").innerHTML = "Medio";
    } else if (valorInputNombre >= 0.30 && valorInputNombre < 0.50) {
        document.getElementById("miDiv").innerHTML = "Alto";
    } else if (valorInputNombre >= 0.50 && valorInputNombre <= 0.80) {
        document.getElementById("miDiv").innerHTML = "Muy alto";
    }
    const inputApellido = document.getElementById('fosforo');
    const valorInputApellido = inputApellido.value;
    const inputTelefono = document.getElementById('Potasio');
    const valorInputTelefono = inputTelefono.value;
    const inputEmail = document.getElementById('DivPotasio');
    const valorInputEmail = inputEmail.value;

    const saveData = async () => {
        user = {
            "nombre": valorInputNombre,
            "muy_bajo": "valorInputApellido",
            "bajo": "valorInputTelefono",
            "medio": "valorInputEmail",
            "alto": "valorInputEmail",
            "muy_alto": "valorInputEmail",
        }
        let options = {
            method: 'POST',
            headers: {
                'Content-Type':
                    'application/json;charset=utf-8'
            },
            body: JSON.stringify(user)
        }


        try {
            const response = await fetch(urls, options)
            const status = response.status
            if (status === 200) {
                const alertaPer = document.createElement('div');
                alertaPer.innerHTML = `<div class="alert alert-success" role="alert">
            Guardado con exito!
            </div>`
                alerta.appendChild(alertaPer);
                setTimeout(() => {
                    alerta.removeChild(alertaPer);
                }, 3000);
                document.getElementById('nombre').value = '';
                document.getElementById('apellido').value = '';
                document.getElementById('telefono').value = '';
                document.getElementById('email').value = '';
            }

        } catch (err) {
            console.log(err)
        }
    }
    saveData()



}   