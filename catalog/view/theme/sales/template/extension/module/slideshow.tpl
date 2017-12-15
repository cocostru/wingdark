<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
<div class="carousel slide" data-ride="carousel">
<div class="carousel-inner slideshow<?php echo $module; ?>">
<?php foreach ($banners as $banner) { ?>
<?php if ($banner['link']) { ?>
<div class="item"><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a></div>
<?php } else { ?>
<div class="item"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></div>
<?php } ?>
<?php } ?>
  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
</div>

<script type="text/javascript"><!--
$(document).ready(function() {
$('.item:first-child').addClass('active');
$('.carousel').carousel();
});
--></script>