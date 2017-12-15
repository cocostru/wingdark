<section class="mail">
    <div class="container" style="width: 100%; padding: 0 45px">
        <div class="row">

            <div class="col-lg-1 col-sm-1 hidden-xs hidden-md hidden-sm">
                <img alt="" class="img-responsive" src="catalog/view/theme/sales/img/i13.png">
                </img>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 hidden-sm">
                <h3 style="line-height: 20px">
                    Подпишитесь
                </h3>
                <h4 style="line-height: 20px">
                    На СКИДКИ
                </h4>
            </div>

            <form id="subscribe_form" method="POST" onsubmit="sendform(event); ">
                <div class="col-lg-3 col-md-4 col-sm-9">
                    <div class="inner-addon left-addon">
                        <i aria-hidden="true" class="fa fa-envelope-o">
                        </i>
                        <input class="form-control" name="email" placeholder="Укажите ваш E-mail" type="email">
                            <input class="form-control " name="latter_text" type="hidden" value="<?php echo $latter_text?>">
                            </input>
                        </input>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-3">
                    <button class="btn btn-subscr btn-block" type="submit">
                        Подписаться
                    </button>
                </div>
            </form>

            <div class="col-lg-4 hidden-xs hidden-sm pull-right text-right" style="position:relative">
                <i class="fa fa-telegram fa-4x hidden-md" style="margin-top: -5px;">
                </i> &nbsp; &nbsp; &nbsp;
                <a style="display: inline-block; color: #fff" href="https://t.me/AllSales_bot" target="_blank">
                    <h4 style="line-height: 20px; float: left;">
                        Наш телеграм бот
                    </h4>
                    <h3 style="line-height: 14px">
                        уведомит Вас о скидках
                    </h3>
                </a>
            </div>

        </div>
    </div>
</section>

<div aria-hidden="true" aria-labelledby="myModalLabel" class="modal fade" id="subscribeModal" role="dialog" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="<?=$modal_styles?>">
                <button aria-hidden="true" class="close" data-dismiss="modal" type="button">
                    ×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    Ваша подписка оформлена
                </h4>
            </div>
            <div class="modal-body">
                <div class="subscribe_result_close2 text-center" id="subscribe_result2" style="<?=$subscribe_block_styles?>">
                    Благодарим за подписку.
                    <!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>-->
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function sendform(event) {
        event.preventDefault();
        var msg;
        msg=$('#subscribe_form').serialize();




        if ($('#subscribe_form input').val()!='') {
            $.ajax({
                type: 'POST',
                url: '<?php echo $action;?>',
                data: msg,
                success: function (data) {
                    $('#subscribeModal').modal('show');
                    $('div #subscribe_result').addClass('subscribe_result_open');

                },
                error: function (xhr, str) {
                    alert('Error: ' + xhr.responseCode);
                }
            });

        }
        else
        {
            alert('Type in your email!');
        }
    }
    $('div #subscribe_result .close').click(function() {
        $('div #subscribe_result').removeClass('subscribe_result_open');
    });
</script>
