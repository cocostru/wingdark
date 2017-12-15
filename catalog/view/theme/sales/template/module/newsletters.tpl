<script>
	function subscribe()
	{
		var emailpattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var email = $('.email').val();
		if(email != "")
		{
			if(!emailpattern.test(email))
			{
				alert("Email inválido");
				return false;
			}
			else
			{
				var data = {
					'nome' : $(".nome").val(),
					'email' : email,
				}
				$.ajax({
					url: 'index.php?route=module/newsletters/news',
					type: 'post',
					data: data,
					dataType: 'json',
					success: function(json) {
						if($('div').hasClass('alert')){
							$(".alert").remove();
						}
						if(json.message == true){
							$("body").before('\
								<div class="alert alert-success">\
									<i class="fa fa-check-circle"></i> Parabéns, você assinou nossa Newsletter!\
									<button type="button" class="close" data-dismiss="alert">×</button>\
								</div>\
							');
							$('input').val('');
							setTimeout(function(){
								$(".alert").remove();
							}, 3000);
						} else{
							$("body").before('\
								<div style="position:fixed;right:0;top:50%;" class="alert alert-danger">\
									<i class="fa fa-exclamation-circle"></i> Este email já esta cadastrado!\
									<button type="button" class="close" data-dismiss="alert">×</button>\
								</div>\
							');
							setTimeout(function(){
								$(".alert").remove();
							}, 3000);
						}
					}
					
				});
				return false;
			}
		}
		else
		{
			alert("Email obrigatório");
			$(email).focus();
			return false;
		}
	}
</script>
<div class="container">
<div class="row">
	
	<form action="" method="post">
		<div class="form-group required">
            <div class="col-sm-10">
              <input type="text" name="nome" id="nome" value="" placeholder="Nome" class="nome form-control input-lg"  /> 
              <input type="email" name="email" value="" placeholder="Email" class="email form-control input-lg"  /> 
    	       
              <button type="submit" class="btn btn-default btn-lg" onclick="return subscribe();">Subscribe</i></button>  
    	       
            </div>
		</div>
		</form>
          
</div>
</div>
