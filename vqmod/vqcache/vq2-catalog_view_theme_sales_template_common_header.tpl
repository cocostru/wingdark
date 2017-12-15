<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
  <head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
      <link href="catalog/view/theme/sales/stylesheet/stylesheet.css" rel="stylesheet">
      <link href="catalog/view/theme/sales/css/bootstrap.css" rel="stylesheet">
      <link href="catalog/view/theme/sales/css/bootstrap-navbar.css" rel="stylesheet">
      <link href="catalog/view/theme/sales/css/owl.carousel.css">
      <link href="catalog/view/theme/sales/css/owl.theme.css" rel="stylesheet">
      <link href="catalog/view/theme/sales/font-awesome-4.4.0/css/font-awesome.css" rel="stylesheet">
      <link href="catalog/view/theme/sales/css/style.css" rel="stylesheet">
      <link href="catalog/view/theme/sales/css/fuelux.min.css" rel="stylesheet">


<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>




      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

</head>
<body class="<?php echo $class; ?> fuelux">


   <div class="body-wrap">
         <header>
            <div class="row">
               <div class="col-lg-3">
                  <div id="logo" class="logo">
                  <?php if ($logo) { ?>
                     <div class="row">
                        <div class="col-xs-3">
                                             <a href="<?php echo $home; ?>">
 <img class="img-responsive" src="catalog/view/theme/sales/img/logo.svg" alt="">
    </a>
                        </div>
                        <div class="col-xs-9">
                           <a href="<?php echo $home; ?>"><h2>500sales.ru</h2>    </a>
                           <p>все российский центр распродаж.</p>
                        </div>
                     </div>
                     </a>
                       <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
                  </div>
               </div>
               <div class="col-lg-7">
                  <div class="search-box">
                     <?php echo $search; ?>
                  </div>
                  <div class="link-search">
              
                     <i class="glyphicon glyphicon-paperclip"></i> <a id="wishlist-total" href="<?php echo $wishlist; ?>" title="<?php echo $text_wishlist; ?>"><?php echo $text_wishlist; ?></a>

                       <i class="glyphicon glyphicon-cog"></i> <a href="http://500sales.ru/index.php?route=product/compare" id="compare-total" >Сравнение товаров</a>
                    
                     <div class="pull-right">
                        <i class="glyphicon glyphicon-send"></i> <a href="http://500sales.ru/index.php?route=information/contact">Обратная связь</a>
                     </div>
                  </div>
               </div>
               <div class="col-lg-2">
                  <div class="cart">
                     <div class="row">
                        <div class="col-xs-4">
                           <img class="img-responsive crt" src="catalog/view/theme/sales/img/cart.svg" alt="">
                        </div>
                        <div class="col-xs-8">
                        <?php echo $cart; ?>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </header>

                
                <script type="text/javascript" language="javascript"><!--
                    
                     function validateEmail($email) {
                        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
                        return emailReg.test( $email );
                      }

                    $(document).ready(function(){
                        $('#subcribe').click(function(){
                            var email = $('#input-newsletter').val();
                            
                            if(email == ''){
                                var error = 'Please enter email address!';
                            }
                            
                            if( !validateEmail(email)) {
                                var error = 'Please enter valid email address!';
                            }
                            
                            if(error != null){
                                $('#error-msg').html('');
                                $('#error-msg').append('<b style=\"color:red\">' + error + '</b>');
                            } else {
                              
                                var dataString = 'email='+ email;
                                $.ajax({
                                    url: 'index.php?route=common/footer/addToNewsletter',
                                    type: 'post',
                                    data: dataString,
                                    success: function(html) {
                                       $('#error-msg').append('<b style=\"color:green\">' + html + '</b>');
                                    }
                                    
                                });
                            }
                            
                        })
                    });
                //--></script>
                
                
      </div>
<?php if ($categories) { ?>
    
  
  <nav class="navbar">
         <div class="container-fluid">
            <div class="navbar-header">
               <button type="button" class="navbar-toggle" data-toggle="offcanvas" data-target="#navbar">
               <span class="sr-only">Toggle navigation</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               </button>
            </div>
            <div id="navbar" class="navbar-offcanvas" data-direction="left">
               <button type="button" class="hidden-sm hidden-md hidden-lg" data-toggle="offcanvas" data-target="#navbar">
               &#10005;
               </button>
                               <?php foreach ($categories as $category) { ?>

               <ul class="nav navbar-nav">
        <?php if ($category['children']) { ?>
                  <li class="dropdown dropdown-megamenu">
                     <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown" role="button">
                     <?php echo $category['name']; ?> <span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li>
                           <div class="megamenu">
                              <div class="megamenu-lists">

                              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                 <ul class="megamenu-list list-col-4">
                                   <!--  <li class="megamenu-list-title"><a href="#">
                                       <img class="img-cat" src="catalog/view/theme/sales/img/i1.png" alt="">
                                       Техника для кухни</a>
                                    </li> -->
                                    <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                                     <?php } ?>

                                 </ul>
                                    <?php } ?>
                               
 
                                
                              </div>

                           </div>
                       
                          
                        </li>
                      
                         <ul  class="megamenu-list">  <li style="background: #f9f9f9;" class="text-center">
                              <a href="<?php echo $category['href']; ?>" class="see-all"><strong><?php echo $text_all; ?> <?php echo $category['name']; ?> <i class="fa fa-long-arrow-right" aria-hidden="true"></i></strong></a>
                           </li> </ul>

                     </ul>

                  </li>
                   <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
               </ul>
                  <?php } ?>
        <?php } ?>
            </div>
         </div>
      </nav>
      <?php } ?>
     <section class="promo">
         <div class="container-fluid">
            <div class="row">
               <div class="col-lg-3">
                  <div class="row">
                     <div class="col-lg-3">
                        <img class="img-responsive" src="catalog/view/theme/sales/img/i7.png" alt="">
                     </div>
                     <div class="col-lg-9">
                        <h3>Пройдите простую регистрацию на сайте</h3>
                     </div>
                  </div>
               </div>
               <div class="col-lg-3">
                  <div class="row">
                     <div class="col-lg-3">
                        <img class="img-responsive" src="catalog/view/theme/sales/img/i8.png" alt="">
                     </div>
                     <div class="col-lg-9">
                        <h3>Продавайте или покупайте товары</h3>
                     </div>
                  </div>
               </div>
               <div class="col-lg-3">
                  <div class="row">
                     <div class="col-lg-3">
                        <img class="img-responsive" src="catalog/view/theme/sales/img/i11.png" alt="">
                     </div>
                     <div class="col-lg-9">
                        <h3>Отслеживайте покупки и продажи в кабинете</h3>
                     </div>
                  </div>
               </div>
               <div class="col-lg-3">
                  <div class="row">
                     <div class="col-lg-3">
                        <img class="img-responsive" src="catalog/view/theme/sales/img/i16.png" alt="">
                     </div>
                     <div class="col-lg-9">
                      <?php if ($logged) { ?>
             <h3><a href="<?php echo $account; ?>">Ваш личный кабинет</a></h3>
            <?php } else { ?>
            <h3><a href="<?php echo $account; ?>">Войдите в кабинет <br> или пройдите регистрацию</a></h3>
            <?php } ?>
                     
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>




