 //este código crea una página web con un encabezado oscuro que contiene un título centrado, 
 seguido de una sección de contenido que carga el contenido de un archivo externo. 
 Además, incluye scripts jQuery para cambiar la apariencia de la barra de navegación 
 según el desplazamiento vertical de la página.//
 <!-- Header-->
 <header class="bg-dark py-5" id="main-header">
     <div class="container h-100 d-flex align-items-end justify-content-center w-100">
         <div class="text-center text-white w-100">
             <h1 class="display-4 fw-bolder mx-5">Nosotros</h1>
         </div>
     </div>
 </header>
 <section class="py-5">
     <div class="container">
         <div class="card rounded-0">
             <div class="card-body">
                 <?php include "about.html" ?>
             </div>
         </div>
     </div>
 </section>

 <script>
     $(document).scroll(function() {
         $('#topNavBar').removeClass('bg-transparent navbar-orange bg-orange')
         if ($(window).scrollTop() === 0) {
            $('#topNavBar').addClass('navbar-orange bg-transparent')
         } else {
             $('#topNavBar').addClass('navbar-dorange bg-orange')
         }
     });
     $(function() {
         $(document).trigger('scroll')
     })
 </script>