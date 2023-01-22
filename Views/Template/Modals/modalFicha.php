<!-- Ficha -->
<div class="modal fade" id="modalFormFicha" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal">Nuevo Ficha</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <!--<div class="tile">
            <div class="tile-body">-->
              <form id="formFicha" name="formFicha" class="form-horizontal">
                <input type="hidden" id="idFicha" name="idFicha" value="">
                <p class="form-group">Todos los campos son obligatorios</p>

                
                <div class="form-row">
                <div class="form-group col-md-6"></div>
                  <label for="txtAnalisis">Analisis de suelo o foliar</label>
                  <input type="text" class="form-control" id="txtAnalisis" name="txtAnalisis" requiered="">
                </div>

                <div class="form-row">
                <div class="form-group col-md-6"></div>
                  <label class="txtNitrogeno">Nitrogeno</label>
                  <input type="text" class="form-control" id="txtNitrogeno" name="txtNitrogeno" requiered="">
                </div>

                <div class="form-row">
                <div class="form-group col-md-6"></div>
                  <label class="txtFosforo">Fosforo</label>
                  <input type="text" class="form-control" id="txtFosforo" name="txtFosforo" requiered="">
                </div>

                <div class="form-row">
                <div class="form-group col-md-6"></div>
                  <label class="txtPotasio">Potasio</label>
                  <input type="text" class="form-control" id="txtPotasio" name="txtPotasio" requiered="">
                </div>

                <div class="form-row">
                <div class="form-group col-md-6"></div>
                  <label class="txtMagnesio">Magnesio</label>
                  <input type="text" class="form-control" id="txtMagnesio" name="txtMagnesio" requiered="">
                </div>

                <div class="form-row">
                <div class="form-group col-md-6"></div>
                  <label class="txtCalcio">Calcio</label>
                  <input type="text" class="form-control" id="txtCalcio" name="txtCalcio" requiered="">
                </div>

                <div class="form-row">
                <div class="form-group col-md-6"></div>
                  <label class="txtAzufre">Azufre</label>
                  <input type="text" class="form-control" id="txtAzufre" name="txtAzufre" requiered="">
                </div>

                <div class="form-row">
                <div class="form-group col-md-6"></div>
                  <label class="txtManganeso">Manganeso</label>
                  <input type="text" class="form-control" id="txtManganeso" name="txtManganeso" requiered="">
                </div>

                <div class="form-row">
                <div class="form-group col-md-6"></div>
                  <label class="txtZinc">Zinc</label>
                  <input type="text" class="form-control" id="txtZinc" name="txtZinc" requiered="">
                </div>

                <div class="form-row">
                <div class="form-group col-md-6"></div>
                  <label class="txtCobre">Cobre</label>
                  <input type="text" class="form-control" id="txtCobre" name="txtCobre" requiered="">
                </div>

                <div class="tile-footer">
                  <button id="btnActionForm" class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i><span id="btnText">Guardar</span></button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#" data-dismiss="modal" ><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                </div>

              </form>
            </div>
          </div>
      </div>
    </div>
  </div>
</div>