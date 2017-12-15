<?php echo $header; ?>
<div class="body-wrap">
<style>
.hvr:hover > h5{
color: #84C225;
text-decoration: none;
}
.text-center {
margin-top: 25px;
}

.text-center a {
  color: #333;
}
.text-center h5 {
margin-top: 15px;
}

</style>
<ul class="breadcrumb">
<?php foreach ($breadcrumbs as $breadcrumb) { ?>
<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
<?php } ?>
</ul>
<?php if ($success) { ?>
<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
<?php } ?>
<div class="row"><?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
<?php $class = 'col-sm-6'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php $class = 'col-sm-9'; ?>
<?php } else { ?>
<?php $class = 'col-sm-12'; ?>
<?php } ?>
<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
<h2><?php echo $text_my_account; ?></h2>
<ul class="list-unstyled">
<div class="col-md-3 text-center" ><a class="hvr" href="<?php echo $edit; ?>"><img src="catalog/view/theme/sales/img/account-images/edit.png" alt="Account Details" >
<h5><?php echo $text_edit; ?></h5></a></div>
<div class="col-md-3 text-center" ><a class="hvr" href="<?php echo $password; ?>"><img src="catalog/view/theme/sales/img/account-images/password.png" alt="Account Password" >
<h5><?php echo $text_password; ?></h5></a></div>
<div class="col-md-3 text-center"><a class="hvr" href="<?php echo $address; ?>"><img src="catalog/view/theme/sales/img/account-images/address.png" alt="Address Book" >
<h5><?php echo $text_address; ?></h5></a></div>
<div class="col-md-3 text-center">
<a class="hvr" href="<?php echo $wishlist; ?>">
<img src="catalog/view/theme/sales/img/account-images/wishlist.png" alt="Wish List" >
<h5><?php echo $text_wishlist; ?></h5>
</a>
</div><div class="clearfix"></div>
</ul>
<h2><?php echo $text_my_orders; ?></h2>
<ul class="list-unstyled">
<div class="col-md-3 text-center" ><a class="hvr" href="<?php echo $order; ?>"><img src="catalog/view/theme/sales/img/account-images/orders.png" alt="Order History" >
<h5><?php echo $text_order; ?></h5></a></div>
<div class="col-md-3 text-center" ><a class="hvr" href="<?php echo $download; ?>"><img src="catalog/view/theme/sales/img/account-images/download.png" alt="Your Downloads" >
<h5><?php echo $text_download; ?></h5></a></div>
<?php if ($reward) { ?>
<div class="col-md-3 text-center" ><a class="hvr" href="<?php echo $reward; ?>"><img src="catalog/view/theme/sales/img/account-images/reward.png" alt="Reward Points" >
<h5><?php echo $text_reward; ?></h5></a></div>
<?php } ?>
<div class="col-md-3 text-center" ><a class="hvr" href="<?php echo $return; ?>"><img src="catalog/view/theme/sales/img/account-images/return.png" alt="Your Returns" >
<h5><?php echo $text_return; ?></h5></a></div>
<div class="col-md-3 text-center" ><a class="hvr" href="<?php echo $transaction; ?>"><img src="catalog/view/theme/sales/img/account-images/trans.png" alt="Transactions" >
<h5><?php echo $text_transaction; ?></h5></a></div>
<div class="col-md-3 text-center" ><a class="hvr" href="<?php echo $recurring; ?>"><img src="catalog/view/theme/sales/img/account-images/payments.png" alt="Recurring Payments" >
<h5><?php echo $text_recurring; ?></h5></a></div><div class="clearfix"></div>
</ul>
<h2><?php echo $text_my_newsletter; ?></h2>
<ul class="list-unstyled">
<div class="col-md-3 text-center" ><a class="hvr" href="<?php echo $newsletter; ?>"><img src="catalog/view/theme/sales/img/account-images/newsletter.png" alt="Your Newsletter" >
<h5><?php echo $text_newsletter; ?></h5></a></div>
<div class="col-md-3 text-center" ><a class="hvr" href="<?php echo $logout_lrppo; ?>"><img src="catalog/view/theme/sales/img/account-images/logout.png" alt="Выход" >
<h5>Выход</h5></a></div>
</ul>
<?php echo $content_bottom; ?></div>
<?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>