 <!-- Header-->
 <header class="bg-dark py-3" id="main-header">
     <div class="container h-100 d-flex align-items-end justify-content-center w-100">
         <div class="text-center text-white w-100">
             <h1 class="display-6 fw-bolder"><?php echo $_settings->info('name') ?></h1>
             <div class="col-auto mt-2">
                 <button class="btn btn-primary btn-lg rounded-0" type="button">En Mantenimiento</button>
             </div>
         </div>
     </div>
 </header>
 <!-- Section-->
 <section class="py-5">
     <div class="container px-4 px-lg-5 mt-5">
         <div class="row">
                     </div>
                 </div>
                 <div class="row gx-4 gx-lg-5 row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-xl-2" id="service_list">
                     <?php
                        $services = $conn->query("SELECT * FROM `service_list` where status = 1 and delete_flag = 0 order by `service`");
                        while ($row = $services->fetch_assoc()) :
                            $row['description'] = strip_tags(html_entity_decode(stripslashes($row['description'])));
                        ?>
                         <a class="col item text-decoration-none text-orange view_service" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>">
                             <div class="callout callout-primary border-primary rounded-0">
                                 <dl>
                                     <dt><?php echo $row['service'] ?></dt>
                                     <dd class="truncate-3 text-muted lh-1"><small><?php echo $row['description'] ?></small></dd>
                                 </dl>
                             </div>
                         </a>
                     <?php endwhile; ?>
                 </div>
                 <div id="noResult" style="display:none" class="text-center"><b>Sin resultados</b></div>
             </div>
         </div>
     </div>
 </section>
 