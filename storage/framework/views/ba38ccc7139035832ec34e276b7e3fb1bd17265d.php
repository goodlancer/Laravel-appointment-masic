<?php $__env->startSection('content'); ?>
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
    </div>


    <div class="container-fluid mt--7">

        <div class="row">

            <div class="col-12">
                <?php if(session('status')): ?>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <?php echo e(session('status')); ?>

                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                <?php endif; ?>
            </div>

            <?php $__currentLoopData = $plans; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $plan): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <div class="col-md-<?php echo e($col); ?>">
                <div class="card shadow">
                    <div class="card-header border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0"><?php echo e($plan['name']); ?></h3>
                            </div>
                            <div class="col-4">
                                <h3 class="mb-0"><?php echo money($plan['price'], env('CASHIER_CURRENCY','usd'),env('DO_CONVERTION',true)); ?>/<?php echo e($plan['period']==1?__('m'):__('y')); ?></h3>
                            </div>

                        </div>
                    </div>


                    <?php if(count($plans)): ?>
                    <div class="table-responsive">
                        <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col"><?php echo e(__('Features')); ?></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $__currentLoopData = explode(",",$plan['features']); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $feature): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <td><?php echo e(__($feature)); ?> </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>
                        </table>


                    </div>
                    <?php endif; ?>
                    <div class="card-footer py-4">
                        <?php if($currentPlan&&$plan['id'].""==$currentPlan->id.""): ?>
                            <a href="" class="btn btn-primary disabled"><?php echo e(__('Current Plan')); ?></a>
                        <?php else: ?>
                            <?php if(strlen($plan['paddle_id'])>2&&env('SUBSCRIPTION_PROCESSOR','Stripe')=='Paddle'): ?>
                                <a href="javascript:openCheckout(<?php echo e($plan['paddle_id']); ?>)" class="btn btn-primary"><?php echo e(__('Switch to ').$plan['name']); ?></a>
                            <?php endif; ?>
                            <?php if(strlen($plan['stripe_id'])>2&&env('SUBSCRIPTION_PROCESSOR','Stripe')=='Stripe'): ?>
                                <a href="javascript:showStripeCheckout(<?php echo e($plan['id']); ?> , '<?php echo e($plan['name']); ?>')" class="btn btn-primary"><?php echo e(__('Switch to ').$plan['name']); ?></a>
                            <?php endif; ?>
                            <?php if(strlen($plan['paypal_id'])>2&&env('SUBSCRIPTION_PROCESSOR','Stripe')=='PayPal'): ?>
                                <div <?php echo 'id="paypal-button-container-'.$plan['paypal_id'].'"'; ?> ></div>
                            <?php endif; ?>

                            <?php if(strlen($plan['mollie_id'])>2&&env('SUBSCRIPTION_PROCESSOR','Stripe')=='Mollie'): ?>
                                <a href="javascript:openMollieCheckout(<?php echo e($plan['id']); ?>)" class="btn btn-primary"><?php echo e(__('Switch to ').$plan['name']); ?></a>
                            <?php endif; ?>

                            <?php if(strlen($plan['paystack_id'])>2&&env('SUBSCRIPTION_PROCESSOR','Stripe')=='Paystack'): ?>
                                <a href="javascript:openPaystackCheckout(<?php echo e($plan['id']); ?>)" class="btn btn-primary"><?php echo e(__('Switch to ').$plan['name']); ?></a>
                            <?php endif; ?>

                            <?php if($plan['price']>0&&(env('SUBSCRIPTION_PROCESSOR','Stripe')=='Local'||env('SUBSCRIPTION_PROCESSOR','Stripe')=='local')): ?>
                                <button  data-toggle="modal" data-target="#paymentModal<?php echo e($plan['id']); ?>" class="btn btn-primary"><?php echo e(__('Switch to ').$plan['name']); ?></button>

                                <!-- Modal -->
                                <div class="modal fade" id="paymentModal<?php echo e($plan['id']); ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-danger modal-dialog-centered modal-" role="document">
                                        <div class="modal-content bg-gradient-danger">
                                        <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel"><?php echo e($plan['name']); ?></h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                        </div>
                                        <div class="modal-body">
                                        <?php echo e(env('LOCAL_TRANSFER_INFO')); ?>

                                        <br /><br />
                                        <?php echo e(env('LOCAL_TRANSFER_ACCOUNT')); ?>

                                        <hr /><br />
                                        <?php echo e(__('Plan price ')); ?><br />
                                        <?php echo money($plan['price'], env('CASHIER_CURRENCY','usd'),env('DO_CONVERTION',true)); ?>/<?php echo e($plan['period']==1?__('m'):__('y')); ?>

                                        </div>
                                        <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo e(__('Close')); ?></button>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            <?php endif; ?>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>


        </div>


        <div class="row mt-4" id="stripe-payment-form-holder" style="display: none">
            <div class="col-md-12">
                <div class="card bg-secondary shadow">
                    <div class="card-header border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0"><?php echo e(__('Subscribe to')); ?> <span id="plan_name">PLAN_NAME</span></h3>
                            </div>

                        </div>
                    </div>
                    <div class="card-body">

                    <form action="<?php echo e(route('plans.subscribe')); ?>" method="post" id="stripe-payment-form"   >
                            <?php echo csrf_field(); ?>
                            <input name="plan_id" id="plan_id" type="hidden" />
                            <div style="width: 100%;" class="form-group<?php echo e($errors->has('name') ? ' has-danger' : ''); ?>">
                                <input name="name" id="name" type="text" class="form-control<?php echo e($errors->has('name') ? ' is-invalid' : ''); ?>" placeholder="<?php echo e(__( 'Name on card' )); ?>" value="<?php echo e(auth()->user()?auth()->user()->name:""); ?>" required>
                                <?php if($errors->has('name')): ?>
                                    <span class="invalid-feedback" role="alert">
                                        <strong><?php echo e($errors->first('name')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>

                            <div class="form">
                                <div style="width: 100%;" #stripecardelement  id="card-element" class="form-control">

                                <!-- A Stripe Element will be inserted here. -->
                              </div>

                              <!-- Used to display form errors. -->
                              <br />
                              <div class="" id="card-errors" role="alert">

                              </div>
                          </div>
                          <div class="text-center" id="totalSubmitStripe">
                            <button
                                v-if="totalPrice"
                                type="submit"
                                class="btn btn-success mt-4 paymentbutton"
                                ><?php echo e(__('Subscribe')); ?></button>
                          </div>

                          </form>


                    </div>
                </div>
            </div>
        </div>

        <?php if($currentPlan): ?>

        <div class="row mt-4">
            <div class="col-md-12">
                <div class="card bg-secondary shadow">
                    <div class="card-header border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0"><?php echo e(__('Your current plan')); ?></h3>
                            </div>

                        </div>
                    </div>
                    <div class="card-body">
                        <p><?php echo e(__('You are currently using the ').$currentPlan->name." ".__('plan')); ?><p>
                            <?php if(strlen(auth()->user()->plan_status)>0): ?>
                            <p><?php echo e(__('Status').": "); ?> <strong><?php echo e(auth()->user()->plan_status); ?></strong><p>
                            <?php endif; ?>
                    </div>
                    <?php if(strlen(auth()->user()->cancel_url)>5&&false): ?>
                    <div class="card-footer py-4">
                        <a href="<?php echo e(auth()->user()->update_url); ?>" target="_blank" class="btn btn-warning"><?php echo e(__('Update subscription')); ?></a>
                        <a href="<?php echo e(auth()->user()->cancel_url); ?>" target="_blank" class="btn btn-danger"><?php echo e(__('Cancel subscription')); ?></a>
                    </div>
                    <?php endif; ?>
                </div>

            </div>

        </div>
        <?php endif; ?>


        <?php echo $__env->make('layouts.footers.auth', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('js'); ?>
<!-- Mollie -->

<script>
    function openMollieCheckout(plan_id){
        $('#plan_id').val(plan_id);

        document.getElementById('stripe-payment-form').submit();
    }

    function openPaystackCheckout(plan_id){
        $('#plan_id').val(plan_id);

        document.getElementById('stripe-payment-form').submit();
    }
</script>
<!-- PayPal -->
<script src="https://www.paypal.com/sdk/js?client-id=<?php echo env('PAYPAL_CLIENT_ID',''); ?>&vault=true&intent=subscription" data-sdk-integration-source="button-factory"></script>
<script type="text/javascript">
    function showLocalPayment(plan_name,plan_id){
        alert(plan_name);
    }
    function updateSubscribtion(subscriptionID, planID){
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $.ajax({
            type:'POST',
            url: '/paypal/subscribe',
            dataType: 'json',
            data: {
                subscriptionID: subscriptionID,
                planID: planID
            },
            success:function(response){
                if(response.status){
                    location.replace(response.success_url);
                    //window.location.reload();
                }
            }, error: function (response) {
            }
        })
    }
    var plans = <?php echo json_encode($plans) ?>;
    var user = <?php echo json_encode(auth()->user()) ?>;
    var payment_processor = <?php echo json_encode(env('SUBSCRIPTION_PROCESSOR','Stripe')) ?>;

    if(payment_processor.toString() == "PayPal"){
        plans.forEach(plan => {
            if(plan.paypal_id != null && user.paypal_subscribtion_id != plan.paypal_id){
                paypal.Buttons({
                    style: {
                        shape: 'rect',
                        color: 'gold',
                        layout: 'vertical',
                        label: 'subscribe'
                    },
                    createSubscription: function(data, actions) {
                        return actions.subscription.create({
                            'plan_id': plan.paypal_id
                        });
                    },
                    onApprove: function(data, actions) {
                        updateSubscribtion(data.subscriptionID, plan.id);
                    }
                }).render('#paypal-button-container-'+plan.paypal_id);
            }
        });
    }
</script>

<!-- Stripe -->
<script src="https://js.stripe.com/v3/"></script>

<script>
  "use strict";
  var STRIPE_KEY="<?php echo e(env('STRIPE_KEY',"")); ?>";
  var ENABLE_STRIPE="<?php echo e(env('SUBSCRIPTION_PROCESSOR','Stripe')=='Stripe'); ?>";
  if(ENABLE_STRIPE){
      js.initStripe(STRIPE_KEY,"stripe-payment-form");
  }

  function showStripeCheckout(plan_id,plan_name){
   $('#plan_id').val(plan_id);
   $('#plan_name').html(plan_name);
   $('#stripe-payment-form-holder').show();
  }
</script>
<script src="<?php echo e(asset('custom')); ?>/js/checkout.js"></script>


<script src="https://cdn.paddle.com/paddle/paddle.js"></script>
<script type="text/javascript">
    "use strict";
    var paddleVendorID=<?php echo e(env('paddleVendorID','')); ?>;
    var currentUserEmail="<?php echo e(auth()->user()->email); ?>";
    Paddle.Setup({ vendor: paddleVendorID  });
	function openCheckout(product_id) {
		var form = document.getElementById('pre-checkout');
		Paddle.Checkout.open({
			product: product_id,
			email: currentUserEmail
		});
	}
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', ['title' => __('Pages')], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/magicqr/core.magicqr.nl/resources/views/plans/current.blade.php ENDPATH**/ ?>