<!-- <div class="row">
    <div class="col-lg-6"> тут код баннера </div>
    <div class="col-lg-6"> тут код банера </div>
</div> -->
<div class="modal fade" id="edit-modal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>
<footer>
    <div class="container-fluid">
        <div class="row" style="display:flex; flex-wrap: wrap;">
            <!-- <div class="col-xs-12 text-center about"> -->
            <div class="col-lg-4 col-md-4 col-sm-8 about">
                <h4> О компании </h4>
                <p> Оцениваем несколькими способами: Яндекс.Метрика, Google Analytics, собственная система статистики на сайте, которая позволяет выяснить эффективность того или иного канала, выраженную в количестве заказов. </p><br/>
                
                <div class="social">

                    <span>
                        <i class="fa fa-vk vk">
                        </i>
                    </span>
                    <span>
                        <i class="fa fa-facebook fb">
                        </i>
                    </span>
                    <span>
                        <i class="fa fa-instagram in">
                        </i>
                    </span>
                    <span>
                        <i class="fa fa-twitter tw">
                        </i>
                    </span>
                </div>
            </div>
            <?php if ($informations) { ?>
            <div class="col-lg-2 col-md-2 col-sm-4 links">
                <h4>
                    <?php echo $text_information; ?>
                </h4>
                <ul class="list-unstyled">
                    <?php foreach ($informations as $information) { ?>
                    <li>
                        <a href="<?php echo $information['href']; ?>">
                            <?php echo $information['title']; ?>
                        </a>
                    </li>
                    <?php } ?>
                </ul>
            </div>
            <?php } ?>
            <div class="col-lg-2 col-md-2 col-sm-4 links">
                <h4>
                    <?php echo $text_extra; ?>
                </h4>
                <ul class="list-unstyled">
                    <li>
                        <a href="http://500sales.ru/affiliate-login/">
                            Хочу продавать свои товары
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo $manufacturer; ?>">
                            <?php echo $text_manufacturer; ?>
                        </a>
                    </li>
                    <!-- <li>
                        <a href="<?php echo $voucher; ?>">
                            <?php echo $text_voucher; ?>
                        </a>
                    </li> -->
                    <li>
                        <a href="<?php echo $affiliate; ?>">
                            <?php echo $text_affiliate; ?>
                        </a>
                    </li>
                    <!-- <li>
                        <a href="<?php echo $special; ?>">
                            <?php echo $text_special; ?>
                        </a>
                    </li> -->
                </ul>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-4 links">
                <h4>
                    <?php echo $text_account; ?>
                </h4>
                <ul class="list-unstyled">
                    <li>
                        <a href="<?php echo $account; ?>">
                            <?php echo $text_account; ?>
                        </a>
                    </li>
                    <!-- <li>
                        <a href="<?php echo $order; ?>">
                            <?php echo $text_order; ?>
                        </a>
                    </li> -->
                    <li>
                        <a href="<?php echo $wishlist; ?>">
                            <?php echo $text_wishlist; ?>
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo $newsletter; ?>">
                            <?php echo $text_newsletter; ?>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-4 links">
                <h4>
                    <?php echo $text_service; ?>
                </h4>
                <ul class="list-unstyled">
                    <li>
                        <a href="<?php echo $contact; ?>">
                            <?php echo $text_contact; ?>
                        </a>
                    </li>
                    <!-- <li>
                        <a href="<?php echo $return; ?>">
                            <?php echo $text_return; ?>
                        </a>
                    </li> -->
                    <li>
                        <a href="<?php echo $sitemap; ?>">
                            <?php echo $text_sitemap; ?>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</footer>
<script src="catalog/view/theme/sales/js/bootstrap.min.js">
</script>
<script src="catalog/view/theme/sales/js/owl.carousel.js">
</script>
<script src="catalog/view/javascript/common.js" type="text/javascript">
</script>
<script src="catalog/view/theme/sales/js/main.js">
</script>
