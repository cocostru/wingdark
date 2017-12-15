<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">

  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>

  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $exportar; ?>" data-toggle="tooltip" title="Exportar Assinantes" class="btn btn-default"><i class="fa fa-save"></i></a>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
    <div class="container-fluid">
       <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Adicionar Assinantes</h3>
            </div>
            <div class="panel-body">
            <form action="<?php echo $form_action; ?>" method="post" enctype="multipart/form-data" id="form-html">
                <div class="inputs">
                    <div class="col-sm-5">
                        <input type="text" name="nome" class="col-sm-4 form-control nome" placeholder="Nome">
                    </div>
                    <div class="col-sm-5">
                        <input type="email" name="email" class="col-sm-4 form-control email" placeholder="Email">
                    </div>
                    <div class="col-sm-2 text-center">
                        <button class="btn btn-success btn-newsletter">Salvar</button>
                    </div>
                </div>
            </form>
          </div>
       </div>
    </div>
    <div class="container-fluid">
	   <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Assinantes</h3>
            </div>
            <div class="panel-body">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <td>Nome</td>
                            <td>Email</td>
                            <td>Ação</td>
                        </tr>
                    </thead>
                    <tbody class="tbody">
                        <?php foreach ($assinantes as $key => $value) : ?>
                            <tr>
                                <td><?php echo $value['nome']; ?></td>
                                <td><?php echo $value['email']; ?></td>
                                <td class="text-center"><span data-id="<?php echo $value['newsletter_id']; ?>" class="btn btn-danger btn-delete"><i class="fa fa-minus"></i></span></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
	        </div>
	   </div>
    </div>
</div>
<script type="text/javascript">
    $(document).on('click', '.btn-delete', function(e){
        var id = {
            id : $(this).data('id')
        }

        $.ajax({
            url : "index.php?route=module/newsletter/remove&token=<?php echo $token; ?>",
            data : id,
            method : 'post',
            dataType: 'json',
            success: function( json ) {
                console.log(json);
                if($("div").hasClass('alert')){
                    $('.alert').remove();
                }
                $(".page-header").before('\
                    <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> Assinante deletado com sucesso! \
                        <button type="button" class="close" data-dismiss="alert">&times;</button>\
                    </div>\
                ');
                $(".tbody").html('');
                $.each(JSON.parse(json.assinantes), function(key, value){
                    $('.tbody').append('\
                        <tr>\
                            <td>' + value.nome +'</td>\
                            <td>' + value.email +'</td>\
                            <td class="text-center"><span data-id="' + value.newsletter_id +'" class="btn btn-danger btn-delete"><i class="fa fa-minus"></i></span></td>\
                        </tr>')
                });
            
            }
        });

    });
    $(document).on('click', '.btn-newsletter', function(e){
        e.preventDefault();
        var data = {
            nome : $(".nome").val(),
            email : $(".email").val()
        };

        $.ajax({
            url : "index.php?route=module/newsletter/add&token=<?php echo $token; ?>",
            data : data,
            method : 'post',
            dataType: 'json',
            success: function( json ) {
                console.log(json);
                if($("div").hasClass('alert')){
                    $('.alert').remove();
                }
                if( json.status == 'false') {
                    $(".page-header").before('\
                        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> Este email já esta cadastrado \
                            <button type="button" class="close" data-dismiss="alert">&times;</button>\
                        </div>');
                } else{
                    $(".page-header").before('\
                        <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> Assinante cadastado com sucesso! \
                            <button type="button" class="close" data-dismiss="alert">&times;</button>\
                        </div>\
                    ');
                    $(".tbody").html('');
                    $.each(JSON.parse(json.assinantes), function(key, value){
                        $('.tbody').append('\
                            <tr>\
                                <td>' + value.nome +'</td>\
                                <td>' + value.email +'</td>\
                                <td class="text-center"><span data-id="' + value.newsletter_id +'" class="btn btn-danger btn-delete"><i class="fa fa-minus"></i></span></td>\
                            </tr>')
                    });
                }
            }
        });
    })
</script>
<?php echo $footer; ?>