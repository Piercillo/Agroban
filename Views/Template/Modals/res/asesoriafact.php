
<!DOCTYPE html>
<html lang="es">
<head> 
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Factura</title>
	<style>
		table{
			width: 100%;
		}
		table td, table th{
			font-size: 12px;
		}
		h4{
			margin-bottom: 0px;
		}
		.text-center{
			text-align: center;
		}
		.text-right{
			text-align: left;
		}
		.wd33{
			width: 33.33%;
		}
		.tbl-cliente{
			border: 1px solid #CCC;
			border-radius: 10px;
			padding: 5px;
		}
		.wd10{
			width: 10%;
		}
		.wd15{
			width: 15%;
		}
		.wd40{
			width: 40%;
		}
		.wd55{
			width: 55%;
		}
		.wd100{
			width: 100%;
		}
		.tbl-detalle{
			border-collapse: collapse;
			width: 100%;
		}
		.tbl-detalle thead th{
			padding: 5px;
			background-color: #009688;
			color: #FFF;
		}
		.tbl-detalle tbody td{
			border: 1px solid #CCC;
			padding: 5px;
			padding-top: 15px;
			padding-bottom: 15px;
		}
		.tbl-detalle tfoot td{
			padding: 5px;
		}
	</style>
</head>
<body>
	<table class="tbl-hader">
		<tbody>
			<tr>
				<td class="wd33">
					<img src="<?= media() ?>/tienda/images/logo.png" alt="Logo">
				</td>
				<td class="text-center wd33">
					<h4><strong><?= NOMBRE_EMPESA ?></strong></h4>
					<p><?= DIRECCION ?> <br>
					Teléfono: <?= TELEMPRESA ?> <br>
					Email: <?= EMAIL_EMPRESA  ?></p>
				</td>
				<td class="text-right wd33">
					
				</td>
			</tr>
		</tbody>
	</table>
	<br>
	<table class="tbl-cliente">
		<tbody>
			<tr>
				<td class="wd15">Código de la asesoría:</td>
				<td class="wd40"><?= $data->codigo ?></td>
			</tr>
			<tr>
				<td class="wd15">Nombre del cliente:</td>
				<td class="wd40"><?= $data->persona ?></td>
			</tr>
			<tr>
				<td class="wd15">Fecha en la que se realizó la consulta:</td>
				<td class="wd40"><?= $data->fecha ?></td>
			</tr>
		</tbody>
	</table>
	<br>
	<table class="tbl-cliente">
		<tbody>
			<tr>
				<td class="wd15">Comentario que dejó:</td>
				<td class="wd55"><?= $data->comentario ?></td>
			</tr>
		</tbody>
	</table>
	<br>
	<table class="tbl-detalle wd100">
		<thead>
			<tr>
				<th colspan="4" class="text-center">Respuestas seleccionadas</th>
			</tr>
			<tr>
				<th class=" text-right">Nombre del formulario</th>
				<th class=" text-right">Nombre de la Pregunta</th>
				<th class=" text-right">Respuesta</th>
				<th class=" text-right">Producto relacionado</th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($data->respuestas as $key => $respuesta): ?>
				<tr>
					<td style="width: 15%;"><?= $respuesta->data->formulario ?></td>
					<td style="width: 15%;"><?= $respuesta->data->pregunta ?></td>
					<td style="width: 25%;">.- <?= $respuesta->data->respuesta ?></td>
					<td style="width: 45%;vertical-align: middle;">
						<?php foreach ($respuesta->data->productos as $keyP => $productos): ?>
							<a href="<?= $productos->data->images[0]->url_image ?>" target="_blank">
								<img src="<?= $productos->data->images[0]->url_image ?>" style="width: 10%;">
							</a> <?= $productos->data->nombre ?>
						<?php endforeach ?>
					</td>
				</tr>
			<?php endforeach ?>
		</tbody>
	</table>
	<div class="text-center">

		<p>Si tienes preguntas sobre tu factura, <br> pongase en contacto con nombre, teléfono y Email</p>
		<h4>¡Gracias!</h4>
	</div>
</body>
</html>