<?php echo $header; ?>
<div  class="aval-product-page-quantity hidden"><?php echo $quantity;?></div><div class="aval-product-page-id hidden"><?php echo $product_id;?></div>


<div class="body-wrap">
  <ul class="breadcrumb">
     <?php
    $breadcount =count($breadcrumbs)-1;
    foreach ($breadcrumbs as $iterator => $breadcrumb) {
    if ($iterator != $breadcount) {
    echo '<li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="'.$breadcrumb['href'].'" itemprop="url"><span itemprop="title">'.$breadcrumb['text'].'</span></a></li>';
    } else {
    echo '<li itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="end"><a href="'.$breadcrumb['href'].'" itemprop="url"></a><span itemprop="title">'.$breadcrumb['text'].'</span></li>';
    }
    } ?>
  </ul>
  <div class="row full-tov"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-md-9 col-sm-12 col-xs-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-md-9 col-sm-12 col-xs-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-5'; ?>
        <?php } ?>
        <div  class="<?php echo $class; ?>">
                   <?php if ($special) { ?>
                   <div style="margin-left: 11px;" class="ribbon1"><span>Акция</span></div>
    <?php } ?>          
          <?php if ($thumb || $images) { ?>
          <ul style="position: relative;" class="thumbnails ">

            <?php if ($thumb) { ?>
            <li><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
            <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>
            <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>






        </div>
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-7'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
        <div class="product-thumb">
<div class="aval-product-quantity hidden"><?php echo $product['quantity'];?></div><div class="aval-product-id hidden"><?php echo $product['product_id'];?></div>
          <h1><?php echo $heading_title; ?></h1>



      <div class="link-search">
  <i class="glyphicon glyphicon-paperclip"></i> <a onclick="wishlist.add('<?php echo $product_id; ?>');" >Отложить товар  </a>

  <i class="glyphicon glyphicon-cog"></i> <a onclick="compare.add('<?php echo $product_id; ?>'); "">Добавить в сравнение</a>
 <span class="nal"><i class="fa fa-check" aria-hidden="true"></i>  <?php echo $stock; ?></span>

      </div>

<div class="nal"></div>





        <?php if ($price) { ?>
<div class="price-full">
            <?php if (!$special) { ?>
        
             <?php echo $price; ?>
           
            <?php } else { ?>
           
        
              <?php echo $special; ?>
            <span><?php echo $price; ?></span>
            <?php } ?>
      
  <!--     Бонусные баллы 
            <?php if ($points) { ?>
            <li><?php echo $text_points; ?> <?php echo $points; ?></li>
            <?php } ?> -->

            <?php if ($discounts) { ?>
            <li>
              <hr>
            </li>
            <?php foreach ($discounts as $discount) { ?>
            <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
            <?php } ?>
            <?php } ?>
</div>
          <?php } ?>




    <ul class="list-unstyled">
            <?php if ($manufacturer) { ?>
            <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
            <?php } ?>
            <li><?php echo $text_model; ?> <?php echo $model; ?></li>

            <?php if ($reward) { ?>
            <li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
            <?php } ?> 

          </ul>

<!-- 
        <div class="mini-desc">
          <?php if(isset($extra_field) && $extra_field) { ?>
        <?php echo $extra_field; ?>
        <?php } ?>
        </div> -->
      
  
          <div id="product">
            <?php if ($options) { ?>

            <h3><?php echo $text_option; ?></h3>
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label class="checkbox-custom" data-initialize="checkbox" id="<?php echo $option_value['product_option_value_id']; ?>">
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?>                    
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label class="checkbox-custom" data-initialize="checkbox"  id="<?php echo $product_option_id; ?>">
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?>
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring; ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>




      <?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>



        <?php if ($review_status) { ?>
          <div class="rating">
            <p>
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
              <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a></p>
           
          </div>
          <?php } ?>


<?php if(isset($extra_field) && $extra_field) { ?>



<div class="row btns-full">

<div class="col-lg-6 col-md-6 col-sm-6">
        <a class="btn btn-full btn-block" href="<?php echo $source_url; ?>">Перейти на сайт продавца</a>

</div>

<div class="col-lg-6 col-md-6 col-sm-6">
    <a data-toggle="modal" data-target="#myModal" class="btn btn-one btn-lg btn-block" href=""><i class="fa fa-envelope-o" aria-hidden="true"></i> Задать вопрос</a>

</div>

</div>





        <?php } else { ?>
         


<div class="row btns-full">
  
<!--   <div class="col-lg-2 col-md-2 col-sm-4">


<div class="spinbox" data-initialize="spinbox" id="mySpinbox">
  <input type="text" name="quantity" value="<?php echo $minimum; ?>" id="input-quantity" class="form-control spinbox-input">
  <div class="spinbox-buttons btn-group btn-group-vertical">
    <button type="button" class="btn btn-up spinbox-up btn-xs">
      <span class="glyphicon glyphicon-chevron-up"></span><span class="sr-only">Increase</span>
    </button>
    <button type="button" class="btn btn-up spinbox-down btn-xs">
      <span class="glyphicon glyphicon-chevron-down"></span><span class="sr-only">Decrease</span>
    </button>
  </div>
</div>
<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />

</div> -->
<!-- <div class="col-lg-6 col-md-5 col-sm-8">
<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-full btn-block buy-me"><?php echo $button_cart; ?></button>
</div> -->
<div class="col-lg-6 col-md-6 col-sm-6">
    <a class="btn btn-full btn-block" href="<?php echo $source_url; ?>">Перейти на сайт продавца</a>
</div>

<!-- <div class="col-lg-4 col-md-5 col-sm-12">
    <a data-toggle="modal" data-target="#myModal" class="btn btn-one btn-lg btn-block" href=""><i class="fa fa-envelope-o" aria-hidden="true"></i> Купить в 1 клик</a>

</div> -->

</div>





        <?php } ?>







 <hr>
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
            <!-- AddThis Button END -->


          
      </div>
          </div>
  
        </div>
      </div>
  

      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>




<!-- ===============================
вкладки -->



          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
            <?php if ($attribute_groups) { ?>
            <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <?php } ?>
            <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab">


    <?php if ($review_status) { ?>
          <div class="rating">
           <?php echo $tab_review; ?>
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
           
          </div>
          <?php } ?>



            </a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
            <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
              <table class="table table-striped ">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                  <tr>
                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <td><?php echo $attribute['text']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </div>








      </div>
    <!--   123 -->

<div class="col-lg-3 col-md-3  col-sm-12 col-xs-12">

<!--   <div class="row">

      <div class="col-lg-6">
       тут код баннера
      </div>

      <div class="col-lg-6">
       тут код банера
      </div>

  </div> -->


<div class="seller">
<?php if ($separate_u_image != ""){ ?>
  <img  class="text-center" src="<?php echo $separate_u_image; ?>" alt="">

<?php } ?>
<h4><a href="<?php echo "index.php?route=product/search&search=merchant" . $separate_u_user_id; ?>"><?php echo $separate_u_name; ?></a></h4>


    <?php   if ($separate_u_add_code != ""){ 
                echo htmlspecialchars_decode($separate_u_add_code);
              }
          ?>




<div class="rating"></div>
<br />

<div class="reg">
Всего товаров : <?php echo $separate_u_total_products; ?>
</div>

<?php if ($separate_u_user_text != ""){ ?>
<p><?php echo $separate_u_user_text; ?></p>
          <?php } ?>

<div class="cont">
 <p class="phone"><i class="glyphicon glyphicon-phone" aria-hidden="true"></i> <?php echo $separate_u_phone; ?></p>
  <p><i class="fa fa-envelope-o" aria-hidden="true"></i> <a data-toggle="modal" data-target="#myModal" href="">отправить сообщение</a></p>
</div>



          <a class="btn btn-orange btn-lg" href="<?php echo "index.php?route=product/search&search=merchant" . $separate_u_user_id; ?>">Все товары продавца</a>

  

<?php if ($separate_u_badge1 != "" or $separate_u_badge2 != "" or $separate_u_badge3 != "" or $separate_u_badge4 != "" or $separate_u_badge5 != "" ){ ?>

<div class="awards">
<h4>Достижения продавца</h4>
  <div class="row">
    <?php if ($separate_u_badge1 != ""){ ?>
    <div class="col-xs-3">
     <img data-toggle="tooltip" data-placement="bottom" title="Актуальность цены и наличия" class="img-responsive" src="<?php echo $separate_u_badge1; ?>" alt=""> 
    </div>
<?php } ?>

            <?php if ($separate_u_badge2 != ""){ ?>
        <div class="col-xs-3">
<img data-toggle="tooltip" data-placement="bottom" title="Больше 100 продаж" class="img-responsive" src="<?php echo $separate_u_badge2; ?>" alt="">
    </div>
<?php } ?>



                <?php if ($separate_u_badge3 != ""){ ?>
            <div class="col-xs-3">
<img data-toggle="tooltip" data-placement="bottom" title="Первое место по качеству обслуживания" class="img-responsive" src="<?php echo $separate_u_badge3; ?>" alt="">
    </div>
<?php } ?>

                <?php if ($separate_u_badge4 != ""){ ?>
            <div class="col-xs-3">
<img data-toggle="tooltip" data-placement="bottom" title="Рекомендуем" class="img-responsive" src="<?php echo $separate_u_badge4; ?>" alt="">
    </div>
<?php } ?>


  </div>


</div>
       <?php } ?>



    
      </div>


</div>

    <?php echo $column_right; ?>




    </div>









<!-- ==============================
Похожие -->

    <?php if ($products) { ?>
     <div class="section-title">
               <img src="catalog/view/theme/sales/img/i3.png" alt="">
               <h4><?php echo $text_related; ?></h4>
               <p>Мы сделали для вас, подборку самых популярных товаров</p>
            </div>



<div class="row">
  <?php foreach ($products as $product) { ?>
  <div class="main-tov text-center col-lg-2 col-md-3 col-sm-6 col-xs-12">

      <a href="<?php echo $product['href']; ?>"><img class="img-responsive" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"  /></a>
        <h2><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
        <?php if ($product['price']) { ?>
       <div class="price-main">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span ><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
        
        </div>
        <?php } ?>

    
  </div>
  <?php } ?>
</div>


      <?php } ?>

    <?php echo $content_bottom; ?>
</div>





<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?php echo $quick_order_jt; ?></h4>
      </div>
      <div class="modal-body">




  <div id="quick-order" >
        <div>
        <input type="hidden" name="quick_product_id" value="<?php echo $product_id; ?>"/>
        
        <?php if(isset($getEmail)){ // проверява дали е логнат потребителя?>
          <div class="form-group">  
            
              <div class="form-group">
                <input type="hidden" name="quick_name" id="quick-name" class="form-control" value="<?php echo $getName; ?>" />
                <input type="hidden" name="quick_phone" id="quick-phone" class="form-control" value="<?php echo $getTelephone; ?>" />
                <input type="hidden" name="quick_email" id="quick-email" class="form-control" value="<?php echo $getEmail; ?>" />
              </div>
                        
              <textarea style="min-height: 150px;" name="quick_comment" id="quick-comment" class="form-control" placeholder="Ваш комментарий" cols="30" ></textarea>
              <br>
              <input type="button" class="btn btn-full btn-block" id="quick-button" value="<?php echo $separate_question_button; ?>" />
            
          </div>
        <?php }else{ ?>
        
          <?php if($separate_customer_login == "0"){ // проверява настройка за логнат потребител?>
          
                    
            <br>
            <div class="form-group">
              <input type="text" name="quick_name" id="quick-name" class="form-control" placeholder="<?php echo $name_jt; ?>" />
            </div>
            <div class="form-group">
              <input type="text" name="quick_phone" id="quick-phone" class="form-control" placeholder="<?php echo $phone_jt; ?>"/>
            </div>
            <div class="form-group">
              <input type="text" name="quick_email" id="quick-email" class="form-control" placeholder="<?php echo $email_jt; ?>" />
            </div>
            
            <div class="form-group">  
                <textarea style="min-height: 150px;" name="quick_comment" id="quick-comment" class="form-control" placeholder="Ваш комментарий" cols="30" ></textarea>
                <br>
                <input type="button" class="btn btn-full btn-block" id="quick-button" value="<?php echo $separate_question_button; ?>" />
            </div>
          
          <?php }else{ ?>
          
            <div class="form-group">  
            
              <div class="form-group">
                <input type="hidden" name="quick_name" id="quick-name" class="form-control" value="<?php echo $getName; ?>" />
                <input type="hidden" name="quick_phone" id="quick-phone" class="form-control" value="<?php echo $getTelephone; ?>" />
                <input type="hidden" name="quick_email" id="quick-email" class="form-control" value="<?php echo $getEmail; ?>" />
              </div>
              
              <textarea disabled name="quick_comment" id="quick-comment" class="form-control" placeholder="<?php echo $separate_question_text_logout; ?>123" ></textarea>
              <br>
              <input type="button" class="btn btn-full btn-block" disabled id="quick-button" value="<?php echo $separate_question_button; ?>" />
            </div>
          <?php } ?>
          
        <?php } ?>
        
          
          
      
        </div>
      </div>

      </div>
<!--       <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div> -->
    </div>
  </div>
</div>


    <script type="text/javascript"><!--
          $('#quick-button').bind('click', function(){
            $.ajax({
              url: 'index.php?route=checkout/checkout/quickorder',
              type: 'post',
              data: $('#quick-order input[type=\'text\'], #quick-order input[type=\'hidden\'], #quick-order textarea'),
              dataType: 'json',
              error: function(json){
              // Функция при ошибочном запросе
                if (json['success']) {
                  $('#quick-order div').hide().after('<div class="col-sm-12"><span class="text-success" style="font-size:small; color:green"><?php echo $order_sent_jt; ?></span></div>');
                }
              },
              success: function(json){
                $('.error').remove();
                if (json['error']){
                  if (json['error']['quick_name']){
                    //$('#quick-name').after('<span class="help-block"><?php echo $enter_name_jt; ?></span>');
                    $('#quick-name').closest('.form-group').addClass('has-error');
                  }
                  if (json['error']['quick_phone']){
                    //$('#quick-phone').after('<span class="help-block"><?php echo $enter_email_jt; ?></span>');
                    $('#quick-phone').closest('.form-group').addClass('has-error');
                  }
                  if (json['error']['quick_email']){
                    //$('#quick-email').after('<span class="help-block"><?php echo $enter_email_jt; ?></span>');
                    $('#quick-email').closest('.form-group').addClass('has-error');
                  }
                }
                if (json['success']) {
                  $('#quick-order div').hide().after('<div class="col-sm-12"><span class="text-success" style="font-size:small; color:red"><?php echo $order_sent_jt; ?></span></div>');
                }
              }
            });
          });
          //--></script> 





<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
  $.ajax({
    url: 'index.php?route=product/product/getRecurringDescription',
    type: 'post',
    data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
    dataType: 'json',
    beforeSend: function() {
      $('#recurring-description').html('');
    },
    success: function(json) {
      $('.alert, .text-danger').remove();

      if (json['success']) {
        $('#recurring-description').html(json['success']);
      }
    }
  });
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-cart').button('loading');
    },
    complete: function() {
      $('#button-cart').button('reset');
    },
    success: function(json) {
      $('.alert, .text-danger').remove();
      $('.form-group').removeClass('has-error');

      if (json['error']) {
        if (json['error']['option']) {
          for (i in json['error']['option']) {
            var element = $('#input-option' + i.replace('_', '-'));

            if (element.parent().hasClass('input-group')) {
              element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            } else {
              element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            }
          }
        }

        if (json['error']['recurring']) {
          $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
        }

        // Highlight any found errors
        $('.text-danger').parent().addClass('has-error');
      }

      if (json['success']) {
        $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

        $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

        
        <?php if($redirect_link){ ?>
          location = '<?php echo $redirect_link; ?>';
          <?php }else{ ?>
          $('html, body').animate({ scrollTop: 0 }, 'slow');
          <?php } ?>
        

        $('#cart > ul').load('index.php?route=common/cart/info ul li');
      }
    },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
  });
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
  pickTime: false
});

$('.datetime').datetimepicker({
  pickDate: true,
  pickTime: true
});

$('.time').datetimepicker({
  pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
  var node = this;

  $('#form-upload').remove();

  $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

  $('#form-upload input[name=\'file\']').trigger('click');

  if (typeof timer != 'undefined') {
      clearInterval(timer);
  }

  timer = setInterval(function() {
    if ($('#form-upload input[name=\'file\']').val() != '') {
      clearInterval(timer);

      $.ajax({
        url: 'index.php?route=tool/upload',
        type: 'post',
        dataType: 'json',
        data: new FormData($('#form-upload')[0]),
        cache: false,
        contentType: false,
        processData: false,
        beforeSend: function() {
          $(node).button('loading');
        },
        complete: function() {
          $(node).button('reset');
        },
        success: function(json) {
          $('.text-danger').remove();

          if (json['error']) {
            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
          }

          if (json['success']) {
            alert(json['success']);

            $(node).parent().find('input').val(json['code']);
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    }
  }, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
  $.ajax({
    url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
    type: 'post',
    dataType: 'json',
    data: $("#form-review").serialize(),
    beforeSend: function() {
      $('#button-review').button('loading');
    },
    complete: function() {
      $('#button-review').button('reset');
    },
    success: function(json) {
      $('.alert-success, .alert-danger').remove();

      if (json['error']) {
        $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
      }

      if (json['success']) {
        $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

        $('input[name=\'name\']').val('');
        $('textarea[name=\'text\']').val('');
        $('input[name=\'rating\']:checked').prop('checked', false);
      }
    }
  });
});

$(document).ready(function() {
  $('.thumbnails').magnificPopup({
    type:'image',
    delegate: 'a',
    gallery: {
      enabled:true
    }
  });
});

$(document).ready(function() {
  var hash = window.location.hash;
  if (hash) {
    var hashpart = hash.split('#');
    var  vals = hashpart[1].split('-');
    for (i=0; i<vals.length; i++) {
      $('div.options').find('select option[value="'+vals[i]+'"]').attr('selected', true).trigger('select');
      $('div.options').find('input[type="radio"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
    }
  }
})
//--></script>
<?php echo $footer; ?>
      <link href="catalog/view/theme/sales/css/fuelux.min.css" rel="stylesheet">
   <script src="catalog/view/theme/sales/js/fuelux.min.js"></script>
