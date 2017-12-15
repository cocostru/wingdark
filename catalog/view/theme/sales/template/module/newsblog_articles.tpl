
  <section class="blog">
         <div class="container-fluid">
            <div class="section-title">
               <h4>Полезная информация</h4>
               <p>Хотите знать как увеличить продажы или модные тренды сезона, читайте наш блог. </p>
            </div>
            <div class="row">



  <?php foreach ($articles as $article) { ?>





               <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                  <div class="news">


     <? if ($article['thumb']) { ?>
     <a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['title']; ?>" title="<?php echo $article['title']; ?>" class="img-responsive" /></a>
      <? } ?>



                    
                     <div class="news-date">
                        <?php echo $article['posted']; ?>
                     </div>
                     <div class="thumbnail">
                        <div class="caption">
                           <a href="<?php echo $article['href']; ?>">
                              <h3><?php echo $article['title']; ?></h3>
                           </a>
                           <p><?php echo $article['description']; ?></p>
                           <a class="btn btn-orange" href="<?php echo $article['href']; ?>">подробнее</a>
                        </div>
                     </div>
                  </div>
               </div>





  <?php } ?>






             



            </div>
         </div>
      </section>