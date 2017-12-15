<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1" name="viewport">
            <meta content="IE=edge" http-equiv="X-UA-Compatible">
                <title> <?php echo $title; ?> </title>
                <base href="<?php echo $base; ?>"/>
                <?php if ($description) { ?>
                <meta content="<?php echo $description; ?>" name="description"/>
                <?php } ?>
                <?php if ($keywords) { ?>
                <meta content="<?php echo $keywords; ?>" name="keywords"/>
                <?php } ?>
                <link href="catalog/view/theme/sales/stylesheet/live_search.css" rel="stylesheet">
                    <link href="catalog/view/theme/sales/stylesheet/stylesheet.css" rel="stylesheet">
                        <link href="catalog/view/theme/sales/css/bootstrap.css" rel="stylesheet">
                            <link href="catalog/view/theme/sales/css/owl.carousel.css">
                                <link href="catalog/view/theme/sales/css/owl.theme.css" rel="stylesheet">
                                    <link href="catalog/view/theme/sales/font-awesome-4.4.0/css/font-awesome.css" rel="stylesheet">
                                        <link href="catalog/view/theme/sales/css/style.css" rel="stylesheet">
                                            <link href="catalog/view/theme/sales/css/bootstrap-navbar.css" rel="stylesheet">
                                                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js">
                                                </script>
                                                <!-- <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script> -->
                                                <!--[if lt IE 9]>
                                                <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
                                                <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
                                                <![endif]-->
                                                <?php foreach ($styles as $style) { ?>
                                                <link href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" rel="<?php echo $style['rel']; ?>" type="text/css"/>
                                                <?php } ?>
                                                <script src="catalog/view/javascript/common.js" type="text/javascript">
                                                </script>
                                                <?php foreach ($links as $link) { ?>
                                                <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
                                                <?php } ?>
                                                <?php foreach ($scripts as $script) { ?>
                                                <script src="<?php echo $script; ?>" type="text/javascript">
                                                </script>
                                                <?php } ?>
                                                <?php foreach ($analytics as $analytic) { ?>
                                                <?php echo $analytic; ?>
                                                <?php } ?>
                                                <script>
                                                    cart.add = function(product_id, quantity) {
                                                        $.ajax({
                                                            url: 'index.php?route=checkout/cart/add',
                                                            type: 'post',
                                                            data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
                                                            dataType: 'json',
                                                            beforeSend: function() {
                                                              $('#cart > button').button('loading');
                                                            },
                                                            complete: function() {
                                                              $('#cart > button').button('reset');
                                                            },
                                                            success: function(json) {
                                                              $('.alert, .text-danger').remove();

                                                              if (json['redirect']) {
                                                                location = json['redirect'];
                                                              }

                                                              if (json['success']) {
                                                                $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                                                                // Need to set timeout otherwise it wont update the total
                                                                setTimeout(function () {
                                                                  $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
                                                                }, 100);

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
                                                      };
                                                </script>
                                            </link>
                                        </link>
                                    </link>
                                </link>
                            </link>
                        </link>
                    </link>
                </link>
            </meta>
        </meta>
    </head>

    <style type="text/css">
        body {
            /*background: #f3f3f3;*/
        }

        #live-search .product-image {
            width: 50px;
            height: 50px;
        }
        #live-search .product-image img {
            height: 100%
        }

        footer {
            padding: 4vh 0 3vh;
            /*max-width: 100%;*/
        }
        .navbar {
            min-height: 45px!important;
            height: 45px;
            overflow: hidden;
            display: none;
        }
        .navbar-nav > li > a {
            padding-top: 12px!important;
            padding-bottom: 12px!important;
        }

        /*.img-responsive {
            width: 54px;
            position: relative;
            top: 2px;
        }*/
        .img-responsive.crt {
            top: -1px;
        }
        .col-lg-2.logo-img {
            width: 22%;
        }
        .mail .img-responsive {
            margin-top: -6px;
            width: 70px;
        }
        .searchTerm {
            padding: 5px 15px;
        }
        .searchTerm:focus {
            border: 2px solid #f39325;
        }
        #cart > .btn {
            font-size: 16px;
        }
        .left-addon .fa {
            left: 10px;
            top: 8px;
        }
        .link-search a {
            margin: 0;
        }
        .container-fluid, .navbar {
            /*max-width: 100%;*/
        }
        .about {
            padding-right: 50px;
        }
        .telegram-wrap {
            padding: 5vh 0 6vh;
        }
        h3, h4, h6 {
            /*font-family: 'pt sans';*/
        }

        footer .about p {
            color: #111;
        }
    </style>

    <body class="<?php echo $class; ?> fuelux">

        <?php if ($categories) { ?>
        <nav class="navbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button class="navbar-toggle" data-target="#navbar" data-toggle="offcanvas" type="button">
                        <span class="sr-only">
                            Разделы сайта
                        </span>
                        <span class="icon-bar">
                        </span>
                        <span class="icon-bar">
                        </span>
                        <span class="icon-bar">
                        </span>
                    </button>
                </div>
                <div class="navbar-offcanvas" data-direction="right" id="navbar">
                    <button class="hidden-sm hidden-md hidden-lg" data-target="#navbar" data-toggle="offcanvas" type="button">
                        ✕
                    </button>
                    <?php foreach ($categories as $category) { ?>
                    <ul class="nav navbar-nav">
                        <?php if ($category['children']) { ?>
                        <li class="dropdown dropdown-megamenu">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="<?php echo $category['href']; ?>" role="button">
                                <?php echo $category['name']; ?>
                                <span class="caret">
                                </span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <div class="megamenu">
                                        <div class="megamenu-lists">
                                            <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                            <ul class="megamenu-list list-col-4">
                                                <li class="megamenu-list-title">
                                                    <a href="#">
                                                        <img alt="" class="img-cat" src="catalog/view/theme/sales/img/i1.png">
                                                            Техника для кухни
                                                        </img>
                                                    </a>
                                                </li>
                                                <?php foreach ($children as $child) { ?>
                                                <li>
                                                    <a href="<?php echo $child['href']; ?>">
                                                        <?php echo $child['name']; ?>
                                                    </a>
                                                </li>
                                                <?php } ?>
                                            </ul>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </li>
                                <ul class="megamenu-list">
                                    <li class="text-center" style="background: #f9f9f9;">
                                        <a class="see-all" href="<?php echo $category['href']; ?>">
                                            <strong>
                                                <?php echo $text_all; ?>
                                                <?php echo $category['name']; ?>
                                                <i aria-hidden="true" class="fa fa-long-arrow-right">
                                                </i>
                                            </strong>
                                        </a>
                                    </li>
                                </ul>
                            </ul>
                        </li>
                        <?php } else { ?>
                        <li>
                            <a href="<?php echo $category['href']; ?>">
                                <?php echo $category['name']; ?>
                            </a>
                        </li>
                    </ul>
                    <?php } ?>
                    <?php } ?>
                </div>
            </div>
        </nav>
        <?php } ?>

        <div class="body-wrap body-top">
            <header>
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-5 col-xs-12">
                        <div class="logo" id="logo">
                            <?php if ($logo) { ?>
                            <div class="row">
                                <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12 logo-img">
                                    <a href="<?php echo $home; ?>"> <img alt="" class="img-responsive" src="catalog/view/theme/sales/img/logo.svg"> </img> </a>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <a href="<?php echo $home; ?>"><h2>500sales.ru</h2></a>
                                    <p>ЦЕНТР РАСПРОДАЖ</p>
                                </div>
                            </div>
                            <?php } else { ?>
                              <h1> <a href="<?php echo $home; ?>"> <?php echo $name; ?> </a> </h1>
                            <?php } ?>
                        </div>
                    </div>
                    <!-- <div class="col-lg-6 col-md-6 col-sm-5 col-xs-12"> -->
                    <div class="col-lg-9 col-md-8 col-sm-7 col-xs-12">
                        <div class="search-box">
                            <?php echo $search; ?>
                        </div>
                        <div class="link-search hidden-sm hidden-xs">
                            <i class="glyphicon glyphicon-paperclip"> </i>
                            <a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>">
                                <?php echo $text_wishlist; ?>
                            </a>
                            <!-- <i class="glyphicon glyphicon-cog"> </i>
                            <a href="http://500sales.ru/index.php?route=product/compare" id="compare-total">
                                Сравнение товаров
                            </a> -->
                            &nbsp; &nbsp; <i aria-hidden="true" class="fa fa-newspaper-o"> </i>
                            <a href="http://500sales.ru/index.php?route=newsblog/category&newsblog_path=1" id="compare-total">
                                Полезная информация
                            </a>
                            <div class="pull-right visible-lg">
                                <i class="glyphicon glyphicon-send"> </i>
                                <a href="http://500sales.ru/index.php?route=information/contact">
                                    Обратная связь
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 pull-right">
                        <div class="cart">
                            <div class="row">
                                <div class="col-lg-3 col-sm-1 col-xs-3 hidden-xs">
                                    <img alt="" class="img-responsive crt" src="catalog/view/theme/sales/img/cart.svg">
                                    </img>
                                </div>
                                <div class="col-lg-8 col-sm-11 col-xs-12">
                                    <?//php echo $cart; ?>
                                </div>
                            </div>
                        </div>
                    </div> -->
                    <div class="col-xs-6">
                        <div class="navbar-header">
                            <button class="navbar-toggle btn-orange btn-block" data-target="#navbar" data-toggle="offcanvas" type="button">
                                <span class=""> Меню сайта </span>
                            </button>
                        </div>
                    </div>
                </div>
            </header>
        </div>

        <section class="promo ">
            <div class="container-fluid">
                <div class="visible-xs">
                    <div class="row">
                        <div class="col-lg-3 col-xs-3">
                            <img alt="" class="img-responsive" src="catalog/view/theme/sales/img/i16.png">
                            </img>
                        </div>
                        <div class="col-lg-9 col-xs-9">
                            <?php if ($logged) { ?>
                            <h3>
                                <a href="<?php echo $account; ?>">
                                    Ваш личный кабинет
                                </a>
                            </h3>
                            <?php } else { ?>
                            <h3>
                                <a href="<?php echo $account; ?>">
                                    Войдите в кабинет
                                    <br>
                                        или пройдите регистрацию
                                    </br>
                                </a>
                            </h3>
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <div class="row hidden-xs">
                    <div class="col-sm-3">
                        <div class="row">
                            <div class="col-lg-3 col-sm-3">
                                <img alt="" class="img-responsive" src="catalog/view/theme/sales/img/i7.png">
                                </img>
                            </div>
                            <div class="col-lg-9 col-sm-9">
                                <h3>
                                    Пройдите простую регистрацию на сайте
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-xs-6">
                        <div class="row">
                            <div class="col-lg-3 col-sm-3">
                                <img alt="" class="img-responsive" src="catalog/view/theme/sales/img/i8.png">
                                </img>
                            </div>
                            <div class="col-lg-9 col-sm-9">
                                <h3>
                                    Продавайте или покупайте товары
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-xs-6">
                        <div class="row">
                            <div class="col-lg-3 col-sm-3">
                                <img alt="" class="img-responsive" src="catalog/view/theme/sales/img/i11.png">
                                </img>
                            </div>
                            <div class="col-lg-9 col-sm-9">
                                <h3>
                                    Отслеживайте покупки и продажи в кабинете
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-xs-6">
                        <div class="row">
                            <div class="col-lg-3 col-xs-4">
                                <img alt="" class="img-responsive" src="catalog/view/theme/sales/img/i16.png">
                                </img>
                            </div>
                            <div class="col-lg-9 col-xs-8">
                                <?php if ($logged) { ?>
                                <h3>
                                    <a href="<?php echo $account; ?>">
                                        Ваш личный кабинет
                                    </a>
                                </h3>
                                <?php } else { ?>
                                <h3>
                                    <a href="<?php echo $account; ?>">
                                        Войдите в кабинет
                                        <br>
                                            или пройдите регистрацию
                                        </br>
                                    </a>
                                </h3>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- <div class="row">
            <div class="col-lg-6"> тут код баннера </div>
            <div class="col-lg-6"> тут код банера </div>
        </div> -->
    </body>
</html>