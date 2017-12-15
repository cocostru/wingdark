<?php echo $header; ?>
<div class="body-wrap">
        <ul class="breadcrumb" >
    <?php
    $breadcount =count($breadcrumbs)-1;
    foreach ($breadcrumbs as $iterator => $breadcrumb) {
    if ($iterator != $breadcount) {
    echo '<li itemscope ><a href="'.$breadcrumb['href'].'" itemprop="url"><span itemprop="title">'.$breadcrumb['text'].'</span></a></li>';
    } else {
    echo '<li itemscope class="end"><a href="'.$breadcrumb['href'].'" itemprop="url"></a><span itemprop="title">'.$breadcrumb['text'].'</span></li>';
    }
    } ?>
      </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
          <div class="search-box-full">
      <div class="row">

        <div class="col-sm-6">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <div class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
    

<div class="col-sm-2">
        <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-subscr btn-block btn-lg" />

</div>
    <div class="col-sm-1 checkbox">
          <label class="checkbox-custom checkbox-inline" data-initialize="checkbox" id="2">
            <?php if ($sub_category) { ?>
            <input id="2" type="checkbox" name="sub_category" value="1" checked="checked" />
            <?php } else { ?>
            <input id="2" type="checkbox" name="sub_category" value="1" />
            <?php } ?>
            Подкатегории</label>
        </div>
      </div>
      </div>
      
           <h1><?php echo $heading_title; ?></h1>

      <?php if ($products) { ?>
    <div class="row">
            <div class="col-md-5 col-sm-6 hidden-xs">
               <?php echo $results; ?>
            </div>
            <div class="col-md-4 col-xs-6">
               <div class="form-group input-group input-group-sm">
                  <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
                  <select id="input-sort" class="form-control" onchange="location = this.value;">
                     <?php foreach ($sorts as $sorts) { ?>
                     <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                     <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                     <?php } else { ?>
                     <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                     <?php } ?>
                     <?php } ?>
                  </select>
               </div>
            </div>
            <div class="col-md-3 col-xs-6">
               <div class="form-group input-group input-group-sm">
                  <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
                  <select id="input-limit" class="form-control" onchange="location = this.value;">
                     <?php foreach ($limits as $limits) { ?>
                     <?php if ($limits['value'] == $limit) { ?>
                     <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                     <?php } else { ?>
                     <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                     <?php } ?>
                     <?php } ?>
                  </select>
               </div>
            </div>
         </div>
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="col-lg-2">
               <div class="tov">
                  <div class="btn-group-vertical button-qik" role="group" aria-label="...">
                     <button data-toggle="tooltip" data-placement="bottom" title="Отложить товар" type="button" class="btn btn-trsp" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-paperclip" aria-hidden="true"></i></button>
                     <button data-toggle="tooltip" data-placement="bottom" title="<?php echo $button_compare; ?>" type="button" class="btn btn-trsp" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-cog" aria-hidden="true"></i></button>
                     <button data-toggle="tooltip" data-placement="bottom" title="Быстрый просмотр" type="button" class="btn btn-trsp"><i class="fa fa-search" aria-hidden="true"></i></button>
                  </div>
                  <!--    <div class="ribbon"><span>новинка</span></div> -->
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>

                  
                  <h2><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
                  <?php if ($product['price']) { ?>
                  <div class="price-main">
                     <?php if (!$product['special']) { ?>
                     <?php echo $product['price']; ?>
                     <?php } else { ?>
                     <?php echo $product['special']; ?> <span class="price-old"><?php echo $product['price']; ?></span>
                     <?php } ?>
                  </div>
                  <?php } ?>
                  <div class="cart-btn">
                     <button class="btn btn-buy" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"> <?php echo $button_cart; ?></button>
                  </div>
               </div>
            </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<?php echo $footer; ?>