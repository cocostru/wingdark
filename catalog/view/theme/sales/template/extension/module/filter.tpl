<div class="side">
<div class="filters">
<legend><?php echo $heading_title; ?></legend>





    <?php foreach ($filter_groups as $filter_group) { ?>
<div class="form-group">
  <label  class="control-label"><?php echo $filter_group['name']; ?></label>
      <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">

        <?php foreach ($filter_group['filter'] as $filter) { ?>
        <div class="checkbox">
          <label class="checkbox-custom" data-initialize="checkbox"  id="<?php echo $filter_id; ?>">
            <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
            <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
            <?php echo $filter['name']; ?>
            <?php } else { ?>
            <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" />
            <?php echo $filter['name']; ?>
            <?php } ?>
          </label>
        </div>
        <?php } ?>

    
  </div>
</div>
    <?php } ?>








  <div class="text-right">
    <button type="button" id="button-filter" class="btn btn-primary"><?php echo $button_filter; ?></button>
  </div>
</div>
</div>

<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	filter = [];

	$('input[name^=\'filter\']:checked').each(function(element) {
		filter.push(this.value);
	});

	location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
//--></script>
