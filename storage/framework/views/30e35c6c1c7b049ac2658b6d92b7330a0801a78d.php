<?php $__env->startSection('content'); ?>
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
    </div>
    <div class="container-fluid mt--7">
        <div class="row">
            <div class="col-xl-7 ">
                <br/>
                <div class="card bg-secondary shadow">
                    <div class="card-header bg-white border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0"><?php echo e("#".$order->id." - ".$order->created_at->format(env('DATETIME_DISPLAY_FORMAT','d M Y H:i'))); ?></h3>
                            </div>
                            <div class="col-4 text-right">
                                <a href="<?php echo e(route('orders.index')); ?>" class="btn btn-sm btn-primary"><?php echo e(__('Back')); ?></a>
                            </div>
                        </div>
                    </div>
                   <?php echo $__env->make('orders.partials.orderinfo', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                   <?php echo $__env->make('orders.partials.actions.buttons',['order'=>$order], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                </div>
            </div>
            <div class="col-xl-5  mb-5 mb-xl-0">
                <?php if(!config('app.isqrsaas')): ?>
                <br/>
                <div class="card card-profile shadow">
                    <div class="card-header">
                        <h5 class="h3 mb-0"><?php echo e(__("Order tracking")); ?></h5>
                    </div>
                    <div class="card-body">
                        <?php echo $__env->make('orders.partials.map',['order'=>$order], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                    </div>
                </div>
                <?php endif; ?>
                <br/>
                <div class="card card-profile shadow">
                    <div class="card-header">
                        <h5 class="h3 mb-0"><?php echo e(__("Status History")); ?></h5>
                    </div>
                    <?php echo $__env->make('orders.partials.orderstatus', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                    
                </div>
                <?php if(auth()->check() && auth()->user()->hasRole('client')): ?>
                <?php if($order->status->pluck('alias')->last() == "delivered"): ?>
                    <br/>
                    <?php echo $__env->make('orders.partials.rating',['order'=>$order], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                <?php endif; ?>
                <?php endif; ?>
            </div>
        </div>
        <?php echo $__env->make('layouts.footers.auth', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php echo $__env->make('orders.partials.modals',['order'=>$order], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('head'); ?>
    <link type="text/css" href="<?php echo e(asset('custom')); ?>/css/rating.css" rel="stylesheet">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('js'); ?>
<!-- Google Map -->
<script async defer src= "https://maps.googleapis.com/maps/api/js?libraries=geometry,drawing&key=<?php echo env('GOOGLE_MAPS_API_KEY',''); ?>"> </script>
  

    <script src="<?php echo e(asset('custom')); ?>/js/ratings.js"></script>
<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts.app', ['title' => __('Orders')], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /Users/danieldimov/Documents/Projects/Mobidonia/CodeCanyon/MRestorant/Site/resources/views/orders/show.blade.php ENDPATH**/ ?>