const urls = base_url+"Models/helpers.php"
const guardar = document.getElementById('guardar-user');

function cargarEventlistener() {
    guardar.addEventListener('click', guardarN)
}
cargarEventlistener();


function guardarN(e) {
    e.preventDefault();
    const alerta = document.getElementById('alerta');
    const inputNombre = document.getElementById('nombre');
    const valorInputNombre = inputNombre.value;
    const inputApellido = document.getElementById('apellido');
    const valorInputApellido = inputApellido.value;
    const inputTelefono = document.getElementById('telefono');
    const valorInputTelefono = inputTelefono.value;
    const inputEmail = document.getElementById('email');
    const valorInputEmail = inputEmail.value;

        const saveData = async () => {
        user = {
            "nombre": valorInputNombre,
            "apellido": valorInputApellido,
            "telefono": valorInputTelefono,
            "email": valorInputEmail
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
            const status =  response.status
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