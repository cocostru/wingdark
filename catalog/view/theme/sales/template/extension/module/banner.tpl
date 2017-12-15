  
         <section class="banners">
            <div class="row">
             <?php foreach ($banners as $banner) { ?>
               <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                  <div class="box box-3">
                     <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
                     <div class="box-text">
                        <a href="<?php echo $banner['link']; ?>">
                           <h2><?php echo $banner['title']; ?></h2>
                        </a>
                     </div>
                  </div>
               </div>
         <?php } ?>

            </div>
         </section>




