<?php
headerTienda($data);
$banner = $data['page']['portada'];
$idpagina = $data['page']['idpost'];

?>
<?php 
	$arrProductos = isset($data['productos'])?$data['productos']:[];
 ?>
<style>
	.container ul, .container ul li {
	    list-style: none;
	}
	body, html {
	    font-size: 20px;
	}
	.p-cr {
	    margin-top: -90px;
	}
	.contenet-cr {
	    padding-top: 90px!important;
	}
	.women.block-cr {
    position: initial!important;
}
.row.isotope-grid {
    height: auto!important;
}
</style>

<script>
	document.querySelector('header').classList.add('header-v4');
</script>
<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url(<?= $banner ?>);">
	<h2 class="ltext-105 cl0 txt-center">
		<?= $data['page']['titulo'] ?>
	</h2>
</section>

<div>
        <label for="tipopago">Datos Nutricionales</label>
        <div class="bor8 bg0 m-b-22">
            <input id="nitrogeno" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode"
                placeholder="Nitrogeno">
            <div id="miDiv"></div>
        </div>
        <div class="bor8 bg0 m-b-22">
            <input id="fosforo" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode"
                placeholder="Fosforo">
            <div id="DivFosforo"></div>
        </div>
        <div class="bor8 bg0 m-b-22">
            <input id="Potasio" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode"
                placeholder="Potasio">
            <div id="DivPotasio"></div>
        </div>
        <div class="bor8 bg0 m-b-22">
            <input id="Magnesio" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode"
                placeholder="Magnesio">
            <div id="DivMagnesio"></div>
        </div>
        <div class="bor8 bg0 m-b-22">
            <input id="Calcio" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode"
                placeholder="Calcio">
            <div id="DivCalcio"></div>
        </div>
        <div class="bor8 bg0 m-b-22">
            <input id="sodio" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode"
                placeholder="sodio">
            <div id="DivSodio"></div>
        </div>
        <div class="bor8 bg0 m-b-22">
            <input id="Hierro" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode"
                placeholder="Hierro">
            <div id="DivHierro"></div>
        </div>
        <div class="bor8 bg0 m-b-22">
            <input id="Manganeso" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode"
                placeholder="Manganeso">
            <div id="DivManganeso"></div>
        </div>
        <div class="bor8 bg0 m-b-22">
            <input id="Zinc" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode" placeholder="Zinc">
            <div id="DivZinc"></div>
        </div>
        <div class="bor8 bg0 m-b-22">
            <input id="Cobre" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode"
                placeholder="Cobre">
            <div id="DivCobre"></div>
        </div>
    </div>

						
						
<!-- Content page -->
<section class="bg0 p-t-104 p-b-116">
	<div class="container">
		<div class="flex-w flex-tr">
			<div class="size-900 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">

				<h4 class="mtext-105 cl2 txt-center p-b-30">
					<?php if (isset($_GET['p'])): ?>
						<a class="btn btn-sm btn-warning" href="<?= base_url().'nutricion' ?>">Recargar</a>
					<?php endif ?>
				</h4>
				<div id="alerta">
				</div>
				<?php
				if (isset($_SESSION['login'])) {
				?>
					
					        <div class="flex-w flex-tr">
			                <div class="size-900 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
							<h4 class="mtext-105 cl2 txt-center p-b-30"> Seleccione la problemática que desea solucionar</h4>
				            </div>
							</div>

						<div class="row">
							<div class="col">
							
								<div class="card">
								  <div class="card-header d-flex align-item-center justify-content-between">
								    <?= $data['formulario']['nombre'] ?> <div class=""><button id="buscarproductos" class="btn btn-primary btn-sm">Buscar productos <i class="fas fa-search"></i></button></div>
								  </div>
								  <div class="card-body">
								  	<?php foreach ($data['preguntas'] as $key => $pregunta): ?>
								  		<h5 class="card-title"><?= $pregunta['nombre'] ?></h5>
								  		<?php foreach ($pregunta['respuestas'] as $keyR => $respuesta): ?>
								  			<div class="form-group">
										    	<div class="custom-control custom-checkbox">
												  <input name="respuesta" 
												  <?php if (isset($_GET['p'])): ?>
												  	<?php if ($_GET['p']!=''): ?>
												  		<?php $listTem = explode(",", $_GET['p']); ?>
												  		<?php if (in_array($respuesta['idformulariodet'], $listTem)): ?>
												  			checked
												  		<?php endif ?>
												  	<?php endif ?>
												  <?php endif ?> type="checkbox" class="custom-control-input" data-id="<?= $respuesta['idformulariodet'] ?>" data-productos='<?= $respuesta['idproducto'] ?>' id="respuesta-<?= $respuesta['idformulariodet'] ?>">
												  <label class="custom-control-label" for="respuesta-<?= $respuesta['idformulariodet'] ?>"><?= $respuesta['respuesta'] ?></label>
												</div>
										    </div>
								  		<?php endforeach ?>
								  	<?php endforeach ?>
								  </div>
								</div>
							</div>
							<div class="col">
								<div class="card">
								  <div class="card-header d-flex align-item-center justify-content-between">
								    Productos recomendados <div class=""><button data-toggle="modal" data-target="#exampleModal" class="btn btn-primary btn-sm">Guardar asesoría <i class="fas fa-plus"></i></button></div>
								  </div>
								  <div class="card-body">
								  	<?php if (!isset($_GET['p'])): ?>
								  		<section class=" text-center">
								        <div class="container">
								          <h1 class="jumbotron-heading">Ningún dato</h1>
								          <p class="lead text-muted">Primero debes seleccionar las problemáticas.</p>
								        </div>
								      </section>
								  	<?php else: ?>
								  		
											<?php foreach ($arrProductos as $keyP => $productos): ?>
												<?php foreach ($productos as $keyPregunta => $pregunta): ?>
													<div class="container-fluid m-0 p-0 pt-4 contenet-cr">
														<div class="row isotope-grid">
															<p class="font-weight-bold p-cr">
																<?= $pregunta['pregunta'] ?>.<br>
																<small><?= $pregunta['contenido'] ?></small>
															</p>
															<?php $listPreguntas = $pregunta['productos']; ?>
															<?php 
																for ($p=0; $p < count($listPreguntas) ; $p++) {
																	$rutaProducto = $listPreguntas[$p]['ruta']; 
																	if(count($listPreguntas[$p]['images']) > 0 ){
																		$portada = $listPreguntas[$p]['images'][0]['url_image'];
																	}else{
																		$portada = media().'/images/uploads/product.png';
																	}
															 ?>
																<div class="col-sm-6 col-md-4 col-lg-6 p-b-35 isotope-item women block-cr">
																	<!-- Block2 -->
																	<div class="block2">
																		<div class="block2-pic hov-img0">
																			<img src="<?= $portada ?>" alt="<?= $listPreguntas[$p]['nombre'] ?>">
																			<a href="<?= base_url().'/tienda/producto/'.$listPreguntas[$p]['idproducto'].'/'.$rutaProducto; ?>" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
																				Ver producto
																			</a>
																		</div>

																		<div class="block2-txt flex-w flex-t p-t-14">
																			<div class="block2-txt-child1 flex-col-l ">
																				<a href="<?= base_url().'/tienda/producto/'.$listPreguntas[$p]['idproducto'].'/'.$rutaProducto; ?>" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
																					<?= $listPreguntas[$p]['nombre'] ?>
																				</a>

																				<span class="stext-105 cl3">
																					<?= SMONEY.formatMoney($listPreguntas[$p]['precio']); ?>
																				</span>
																			</div>

																			<div class="block2-txt-child2 flex-r p-t-3">
																				<a href="#"
																				 id="<?= openssl_encrypt($listPreguntas[$p]['idproducto'],METHODENCRIPT,KEY); ?>"
																				 class="btn-addwish-b2 dis-block pos-relative js-addwish-b2 js-addcart-detail
																				 icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11
																				 ">
																					<i class="zmdi zmdi-shopping-cart"></i>
																				</a>
																			</div>
																		</div>
																	</div>
																	<div class="mt-2 position-relative">
																		<?php 
																			$idtemp = uniqid();
																		 ?>
																	  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample<?= $idtemp ?>" aria-expanded="false" aria-controls="collapseExample<?= $idtemp ?>">
																	    Ver descripción
																	  </button>
																		<div class="collapse" style="position: absolute;width: 100%;top: 60px;z-index: 9999;width: 320px;background: #fff;" id="collapseExample<?= $idtemp ?>">
																		  <div class="card card-body" style="font-size: 15px;line-height: 1.2;">
																		    <?= $listPreguntas[$p]['descripcion'] ?>
																		  </div>
																		</div>
																	</div>
																</div>

																
															<?php } ?>
														</div>
													</div>
												<?php endforeach ?>
											<?php endforeach ?>
								  	<?php endif ?>
								  	
								  	
								  </div>
								</div>
							</div>
						</div>

						<!--
							Calculadora de medidas usables
						-->

						<div class="row">
                        <div class="container">
                            <h1 class="text-center">Cálculo del peso de su suelo</h1>
                            <h5 class="text-center">Es importante establecer el peso de su suelo para calcular las necesidades nutricionales de su suelo</h5>
                            <div class="row justify-content-center mt-3">
                                <label class="col-3 col-form-label">Ingrese la profundidad de su muestra</label>
                                <div class="col-8 col-md-4">
                                    <input type="number" class="form-control" id="profundidad">
                                </div>
                            </div>
                            <div class="row justify-content-center mt-3">
                                <label class="col-3 col-form-label">Ingrese la densidad puede estar entre 1.1 a 1.6</label>
                                <div class="col-8 col-md-4">
                                    <input type="number" class="form-control" id="densidad">
                                </div>
                            </div>
                        </div>
						<div class="container">
                        <div class="row justify-content-center mt-3">
                            <div class="col-8 col-md-5">
                                <button class="btn btn-success col-12" id="pesosuelo">Cálcular peso del cultivo</button>
                            </div>
                        </div>
						</div>
						<div class="container">
                        <div class="row justify-content-center mt-4">
                            <div class="alert alert-success  col-8 col-md-6" role="alert" id="respuestapesosuelo">
                                
                            </div>
                        </div>
						</div>
                        <!--Calcular nitrogeno-->
                        <div class="container">
                            <h1 class="text-center">Cálculo del nitrógeno requerido</h1>
                            <h5 class="text-center">Para cálcular el nitrogeno se requiere conocer el peso del suelo, los valores estan basados para el uso de fertilizante conocido como Urea</h5>
                            <div class="row justify-content-center mt-3">
                                <label class="col-3 col-form-label">Ingrese el peso de su cultivo</label>
                                <div class="col-8 col-md-4">
                                    <input type="number" class="form-control" id="pesoNitrogeno">
                                </div>
                            </div>
                            <div class="row justify-content-center mt-3">
                                <label class="col-3 col-form-label">Ingrese la materia orgánica</label>
                                <div class="col-8 col-md-4">
                                    <input type="number" class="form-control" id="moNitrogeno">
                                </div>
                            </div>
                        </div>
						<div class="container">
                        <div class="row justify-content-center mt-3">
                            <div class="col-8 col-md-5">
                                <button class="btn btn-success col-12" id="calcularNitrogeno">Cálcular nitrógeno</button>
                            </div>
                        </div>
						</div>
						<div class="container">
                        <div class="row justify-content-center mt-4">
                            <div class="alert alert-success  col-8 col-md-6" role="alert" id="respuestaNitrogeno">
                                
                            </div>
                        </div>
						</div>
                        <!--Calcular fósforo-->
                        <div class="container">
                            <h1 class="text-center">Cálculo de la cantidad de fósforo requerido</h1>
                            <h5 class="text-center">Este elemento juega un papel muy importante en la fotosíntesis, en el transporte de nutrientes, para este cálculo se toma en cuenta los valores nutricionales del fertilizante DAP</h5>
                            <div class="row justify-content-center mt-3">
                                <label class="col-3 col-form-label">Ingrese el peso de su cultivo</label>
                                <div class="col-8 col-md-4">
                                    <input type="number" class="form-control" id="pesoFosforo">
                                </div>
                            </div>
                            <div class="row justify-content-center mt-3">
                                <label class="col-3 col-form-label">Ingrese la materia orgánica del fósforo</label>
                                <div class="col-8 col-md-4">
                                    <input type="number" class="form-control" id="moFosforo">
                                </div>
                            </div>
                        </div>
						<div class="container">
                        <div class="row justify-content-center mt-3">
                            <div class="col-8 col-md-5">
                                <button class="btn btn-success col-12" id="calcularFosforo">Cálcular fósforo</button>
                            </div>
                        </div>
						</div>
						<div class="container">
                        <div class="row justify-content-center mt-4">
                            <div class="alert alert-success  col-8 col-md-6" role="alert" id="respuestaFosforo">
                                
                            </div>
                        </div>
						</div>
                        <!--Calcular potasio-->
                        <div class="container">
                            <h1 class="text-center">Cálculo de la cantidad de potasio requerido</h1>
                            <h5 class="text-center">El potasio es considerado como el nutriente más importante en la nutrición del cultivo debido a que es el nutrimento que la planta de banano requiere en mayores cantidades </h5>
                            <div class="row justify-content-center mt-3">
                                <label class="col-3 col-form-label">Ingrese el peso de su cultivo</label>
                                <div class="col-8 col-md-4">
                                    <input type="number" class="form-control" id="pesoPotasio">
                                </div>
                            </div>
                            <div class="row justify-content-center mt-3">
                                <label class="col-3 col-form-label">Ingrese la materia orgánica del potasio (meq)</label>
                                <div class="col-8 col-md-4">
                                    <input type="number" class="form-control" id="moPotasio">
                                </div>
                            </div>
                        </div>
						<div class="container">
                        <div class="row justify-content-center mt-3">
                            <div class="col-8 col-md-5">
                                <button class="btn btn-success col-12" id="calcularPotasio">Cálcular potasio</button>
                            </div>
                        </div>
						</div>
						<div class="container">
                        <div class="row justify-content-center mt-4">
                            <div class="alert alert-success  col-8 col-md-6" role="alert" id="respuestaPotasio">
                                
                            </div>
                        </div>
						</div>
                        </div>

						<!--
							Calculadora de medidas usables
						-->

				<?php } else { ?>

					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item">
							<a class="nav-item nav-link active" id="profile-tab" data-toggle="tab" href="#secion" role="tab" aria-controls="profile" aria-selected="false">Iniciar Sesión</a>
						</li>
						<li class="nav-item">
							<a class="nav-item nav-link" id="profile-tab" data-toggle="tab" href="#registro" role="tab" aria-controls="profile" aria-selected="false">Crear cuenta</a>
						</li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="secion" role="tabpanel" aria-labelledby="profile-tab">
							<br>
							<form name="formLogin_cr" id="formLogin_cr" >
								<input type="hidden" name="redirect" value="/nutricion">
								<div class="row">
									<div class="col col-md-6 form-group">
										<label for="txtEmail">Email</label>
										<input name="txtEmail" id="txtEmail" type="email" class="form-control valid validEmail" id="txtEmailCliente" name="txtEmailCliente" required="">
									</div>
									<div class="col col-md-6 form-group">
										<label for="txtPassword">Contraseña</label>
										<input name="txtPassword" id="txtPassword" type="password" class="form-control" id="contrasena" name="contrasena" required="" >
									</div>
								</div>
								<button type="submit" class="btn btn-primary">Iniciar sesión</button>
							</form>
						</div>
						<div class="tab-pane fade" id="registro" role="tabpanel" aria-labelledby="profile-tab">
							<br>
							<form>
								<div class="row">
									<div class="col col-md-6 form-group">
										<label for="txtNombre">Nombres</label>
										<input name="nombre" id="nombre" type="text" class="form-control valid validText" id="txtNombre" name="txtNombre" required="">
									</div>
									<div class="col col-md-6 form-group">
										<label for="txtApellido">Apellidos</label>
										<input name="apellido" id="apellido" type="text" class="form-control valid validText" id="txtApellido" name="txtApellido" required="">
									</div>
								</div>
								<div class="row">
									<div class="col col-md-6 form-group">
										<label for="txtTelefono">Teléfono</label>
										<input name="telefono" id="telefono" type="text" class="form-control valid validNumber" id="txtTelefono" name="txtTelefono" required="" onkeypress="return controlTag(event);">
									</div>
									<div class="col col-md-6 form-group">
										<label for="txtEmailCliente">Email</label>
										<input name="email" id="email" type="email" class="form-control valid validEmail" id="txtEmailCliente" name="txtEmailCliente" required="">
									</div>
								</div>
								<button type="submit" id="guardar-user" class="btn btn-primary">Regístrate</button>
							</form>
						</div>
					</div>
				<?php } ?>

			</div>
		</div>
		
	</div>
	</div>
	</div>
</section>
<?php
if (viewPage($idpagina)) {
	//echo $data['page']['contenido'];
?>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Guardar asesoria</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="form-group">
		    <label for="comentario">Comentario</label>
		    <textarea class="form-control" id="comentario" rows="3"></textarea>
		  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="save-asesoria">Guardar asesoría</button>
      </div>
    </div>
  </div>
</div>

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="Tp/img/favicon.png" rel="icon">
  <link href="Tp/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="Tp/vendor/aos/aos.css" rel="stylesheet">
  <link href="Tp/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="Tp/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="Tp/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="Tp/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="Tp/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="Tp/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="Tp/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Bootslander - v4.9.1
  * Template URL: https://bootstrapmade.com/bootslander-free-bootstrap-landing-page-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

<!-- ======= Gallery Section ======= -->
<section id="gallery" class="gallery">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2>Deficiencias</h2>
          <p>Resultados de la falta de macro y micronutrientes</p>
        </div>

        <div class="row g-0" data-aos="fade-left">

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item" data-aos="zoom-in" data-aos-delay="100">
            <p>Nitrogeno</p>
              <a href="Tp/img/gallery/gallery-1.jpg" class="gallery-lightbox">
                <img src="Tp/img/gallery/gallery-1.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item" data-aos="zoom-in" data-aos-delay="150">
            <p>Fosforo</p>
              <a href="Tp/img/gallery/gallery-2.jpg" class="gallery-lightbox">
                <img src="Tp/img/gallery/gallery-2.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item" data-aos="zoom-in" data-aos-delay="200">
            <p>Potasio</p>
              <a href="Tp/img/gallery/gallery-3.jpg" class="gallery-lightbox">
                <img src="Tp/img/gallery/gallery-3.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item" data-aos="zoom-in" data-aos-delay="250">
            <p>Magnesio</p>
              <a href="Tp/img/gallery/gallery-4.jpg" class="gallery-lightbox">
                <img src="Tp/img/gallery/gallery-4.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item" data-aos="zoom-in" data-aos-delay="300">
            <p>Calcio</p>
              <a href="Tp/img/gallery/gallery-5.jpg" class="gallery-lightbox">
                <img src="Tp/img/gallery/gallery-5.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item" data-aos="zoom-in" data-aos-delay="350">
            <p>Azufre</p>
              <a href="Tp/img/gallery/gallery-6.jpg" class="gallery-lightbox">
                <img src="Tp/img/gallery/gallery-6.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item" data-aos="zoom-in" data-aos-delay="400">
            <p>Hierro</p>
              <a href="Tp/img/gallery/gallery-7.jpg" class="gallery-lightbox">
                <img src="Tp/img/gallery/gallery-7.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item" data-aos="zoom-in" data-aos-delay="450">
            <p>Manganeso</p>
              <a href="Tp/img/gallery/gallery-8.jpg" class="gallery-lightbox">
                <img src="Tp/img/gallery/gallery-8.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item" data-aos="zoom-in" data-aos-delay="450">
            <p>Zinc</p>
              <a href="Tp/img/gallery/gallery-9.jpg" class="gallery-lightbox">
                <img src="Tp/img/gallery/gallery-9.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item" data-aos="zoom-in" data-aos-delay="450">
            <p>Cobre</p>
              <a href="Tp/img/gallery/gallery-10.jpg" class="gallery-lightbox">
                <img src="Tp/img/gallery/gallery-10.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Gallery Section -->


    <!-- ======= Gallery Section ======= -->
<section id="gallery" class="gallery">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2>Sobrecarga</h2>
          <p>Resultados de los excesos de los macro y micronutrientes</p>
        </div>

        <div class="row g-0" data-aos="fade-left">

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item" data-aos="zoom-in" data-aos-delay="100">
            <p>Nitrogeno</p>
              <a href="Tp/img/gallery/gallery-11.jpg" class="gallery-lightbox">
                <img src="Tp/img/gallery/gallery-11.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item" data-aos="zoom-in" data-aos-delay="150">
            <p>Potasio</p>
              <a href="Tp/img/gallery/gallery-12.jpg" class="gallery-lightbox">
                <img src="Tp/img/gallery/gallery-12.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          
          
        </div>

      </div>
    </section><!-- End Gallery Section -->

  

  <!-- Vendor JS Files -->
  <script src="Tp/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="Tp/vendor/aos/aos.js"></script>
  <script src="Tp/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="Tp/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="Tp/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="Tp/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="Tp/js/main.js"></script>

</body>

</html>




<script src="<?= media() ?>/tienda/vendor/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<?= media();?>/js/plugins/sweetalert.min.js"></script>

<script>
    $(function(){
    	if(document.querySelector("#formLogin_cr")){
			let formLogin_cr = document.querySelector("#formLogin_cr");
			formLogin_cr.onsubmit = function(e) {
			e.preventDefault();

			let strEmail = document.querySelector('#txtEmail').value;
			let strPassword = document.querySelector('#txtPassword').value;

			if(strEmail == "" || strPassword == "")
			{
				swal("Por favor", "Escribe usuario y contraseñaa.", "error");
				return false;
			}else{
				divLoading.style.display = "flex";
				var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
				var ajaxUrl = base_url+'/nutricion/loginUser'; 
				var formData = new FormData(formLogin_cr);
				request.open("POST",ajaxUrl,true);
				request.send(formData);
				request.onreadystatechange = function(){
					if(request.readyState != 4) return;
					if(request.status == 200){
						var objData = JSON.parse(request.responseText);
						if(objData.status)
						{
							//window.location = base_url+'/dashboard';
							window.location.reload(false);
						}else{
							swal("Atención", objData.msg, "error");
							document.querySelector('#txtPassword').value = "";
						}
					}else{
						swal("Atención","Error en el proceso", "error");
					}
					divLoading.style.display = "none";
					return false;
				}
			}
		}
		}

		$('#buscarproductos').click(function(){
			var arr = [];
			var existe = false;
			$.each($("input[name='respuesta']:checked"), function(){
				var attrId = $(this).data('id');
			  	arr.push(attrId);
			  	existe = true;
			});
			if(existe){
				window.location = base_url + 'nutricion?p='+ arr.join(", ");
			}else{
				swal("Atención", 'Debe seleccionar un items para buscar', "error");
			}
		})

		$('#save-asesoria').click(function(){
			var comentario = $('#comentario').val() || '';
			if(comentario == ''){
				swal("Atención", 'Debe seleccionar un items para guardar la asesoría', "error");
			}else{
				var btn = $(this);
                var icon = btn.html();
                var estado = 1;
                var loading = '<i class="fa fa-circle-o-notch fa-spin"></i>';
                var warning = '<i class="fa fa-warning"></i>';
                $.ajax({
                    url: base_url+'/asesorias/saveAsesoria',
                    type: 'POST',
                    data: {
                    	'comentario': $('#comentario').val(), 
                    	'idformulariodet': '<?= isset($_GET['p'])?json_encode(explode(',', $_GET['p'])):'[]' ?>'
                    },
                    dataType: 'JSON',
                    beforeSend: function () {
                        btn.html(loading);
                        $('#save-asesoria').prop('disabled', true);
                    }
                }).done(function (data) {
                    if(data.status){
                    	swal("", 'Registro guardado!!' ,"success");
                    	$('#exampleModal').modal('hide');
                    	
                    }
                    setTimeout(function(){
                        btn.html(icon);
                        $('#save-asesoria').prop('disabled', false);
                    },2000);
                    return;
                }).fail(function () {
                    btn.html(warning);
                    setTimeout(function(){
                        btn.html(icon);
                        $('#save-asesoria').prop('disabled', false);
                    },2000);
                });
			}
		})

		$('#exampleModal').on('hidden.bs.modal', function (e) {
		  $('#comentario').val('');
		})
    })
</script>

<?php
}
footerTienda($data);
?>