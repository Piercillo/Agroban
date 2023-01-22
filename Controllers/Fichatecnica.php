<?php 
	class Tienda extends Controllers{
		public function __construct()
		{   session_start();
			parent::__construct();
			
		}

		public function Tienda()
		{
			$pageContent = getPageRout('inicio');
			$data['page_tag'] = NOMBRE_EMPESA;
			$data['page_title'] = NOMBRE_EMPESA;
			$data['page_name'] = "tienda_virtual";
			$data['page'] = $pageContent;
			/*$data['productos'] = $this->getProductosT();*/
			$this->views->getView($this,"tienda",$data); 
		}

	}
 ?>