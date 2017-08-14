<?php
/**
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.View.Layouts
 * @since         CakePHP(tm) v 0.10.0.1076
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */
?>
<?php echo $this->Html->docType('html5'); ?> 
<html>
	<head>
		<?php echo $this->Html->charset(); ?>

		<title>
			<?php echo $page_title; ?>
		</title>
		<?php 
			echo $this->Html->meta('icon');
			echo $this->Html->meta(['name' => 'viewport', 'content' => 'width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no']);
			echo $this->fetch('meta');

			echo $this->Html->css('bootstrap.min.css');
			echo $this->Html->css('//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css');
			echo $this->Html->css('ionicons.min.css');
			echo $this->Html->css('//fonts.googleapis.com/css?family=Droid+Serif:400,700,700italic,400italic');
			echo $this->Html->css('CakeAdminLTE');
			echo $this->Html->css('datatables/dataTables.bootstrap'); 
			echo $this->Html->css('datepicker/datepicker3'); 
			echo $this->Html->css('chosen'); 
			echo $this->fetch('css');
			//echo $this->Html->script('libs/jquery-1.10.2.min');
			//echo $this->Html->script('libs/bootstrap.min');
			
			echo $this->fetch('script');
		?>
		<?php
			echo $this->Html->script('jquery.min');
			echo $this->Html->script('bootstrap.min');
			echo $this->Html->script('CakeAdminLTE/app');
			echo $this->Html->script('plugins/datepicker/bootstrap-datepicker');
			echo $this->Html->script('plugins/slimScroll/jquery.slimscroll');
			echo $this->Html->script('plugins/print/jQuery.print');
			echo $this->Html->script('select-chain');
			echo $this->Html->script('chosen');
			echo $this->fetch('script');
		?>
		<script>
		$(document).ready(function (){
			$('.datepicker').datepicker({
				format: "dd-mm-yyyy",
				autoclose: true,
				todayHighlight: true
			});	
			
			$('.expire_datepicker').datepicker({
				format: "mm-yy",
				startView: "year", 
				minViewMode: "months",
				autoclose: true
			});			
		});
		</script>
	</head>

	<body class="skin-blue fixed">
		<?php echo $this->element('menu/top_menu'); ?>
		<div class="wrapper row-offcanvas row-offcanvas-left">
			<?php echo $this->element('menu/left_sidebar'); ?>
		
			<!-- Right side column. Contains the navbar and content of the page -->
		    <aside class="right-side">		    	
				<section class="content"> 
				<?php echo $this->Session->flash(); ?>
				<?php echo $this->fetch('content'); ?>				
				</section>
				<!--
				<p align="center">Developed By <a href="http://www.arena.com.bd" target="_blank">Arena Phone BD Ltd.</a></p>
				-->
				<?php echo $this->element('sql_dump'); ?>
			</aside><!-- /.right-side -->	
			
		</div><!-- ./wrapper -->				
	</body>
	
</html>