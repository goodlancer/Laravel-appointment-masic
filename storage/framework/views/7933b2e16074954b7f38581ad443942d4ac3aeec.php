<?php $__env->startSection('content'); ?>
    <?php if( !request()->get('location') ): ?>
        <?php echo $__env->make('layouts.headers.search', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <?php else: ?>
        <?php echo $__env->make('layouts.headers.filters', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <?php endif; ?>

    <?php $__currentLoopData = $sections; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $section): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

        <section class="section" id="main-content">
            <div class="container mt--100">
                <h2><?php echo e($section['title']); ?></h2>
                <?php if(isset($section['super_title'])): ?>
                    <h2 class="super_title"><?php echo e($section['super_title']); ?></h2>
                <?php endif; ?>
                
                <br />
                <div class="row">
                    <!-- Stores -->
                    <?php if(isset($section['restorants'])): ?>
                        <?php $__empty_1 = true; $__currentLoopData = $section['restorants']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $restorant): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                            <?php $link=route('vendor',['alias'=>$restorant->alias]); ?>
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                                <div class="strip">
                                    <figure>
                                    <a href="<?php echo e($link); ?>"><img src="<?php echo e($restorant->logom); ?>" data-src="<?php echo e(config('global.restorant_details_image')); ?>" class="img-fluid lazy" alt=""></a>
                                    </figure>
                                    <span class="res_title"><b><a href="<?php echo e($link); ?>"><?php echo e($restorant->name); ?></a></b></span><span class="float-right"><i class="fa fa-star" style="color: #dc3545"></i> <strong><?php echo e(number_format($restorant->averageRating, 1, '.', ',')); ?> <span class="small">/ 5 (<?php echo e(count($restorant->ratings)); ?>)</strong></span></span><br />
                                    <span class="res_description"><?php echo e($restorant->description); ?></span><br />
                                    <span class="res_mimimum"><?php echo e(__('Minimum order')); ?>: <?php echo money($restorant->minimum, env('CASHIER_CURRENCY','usd'),env('DO_CONVERTION',true)); ?></span>
                                </div>
                            </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                            <div class="col-md-12">
                            <p class="text-muted mb-0"><?php echo e(__('Hmmm... Nothing found!')); ?></p>
                            </div>

                        <?php endif; ?>
                    <?php endif; ?>
                    
                    
                    <!-- Cities -->
                    <?php if(isset($section['cities'])): ?>
                        <?php $__empty_1 = true; $__currentLoopData = isset($section['cities'])?$section['cities']:[]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $city): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                            <?php $link=route('show.stores',['city'=>$city->alias]); ?>
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                                <div class="strip strip_city">
                                    <figure>
                                        
                                        <a href="<?php echo e($link); ?>"><img src="<?php echo e($city->logo); ?>" data-src="<?php echo e(config('global.restorant_details_image')); ?>" class="img-fluid lazy" alt=""></a>
                                        
                                        <span class="city_title mt--1"><b><a class="text-white" href="<?php echo e($link); ?>"><?php echo e($city->name); ?></a></b></span><br />
                                        <a href="<?php echo e($link); ?>" class="city_letter mt--1 text-red fade-in"><?php echo e($city->alias); ?></a>
                                    </figure>
                                    
                                </div>
                            </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                            <div class="col-md-12">
                            <p class="text-muted mb-0"><?php echo e(__('Hmmm... Nothing found!')); ?></p>
                            </div>

                        <?php endif; ?>
                    <?php endif; ?>

                </div>

                

            </div>
        </section>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>


    <?php if(config('global.playstore') || config('global.appstore')): ?>
    <hr>
    <section class="row row-grid align-items-center mt section" style="  ">
        <div class="container py-md">
            <div class="row justify-content-between align-items-center">
            <div class="col-lg-6">
                <h2 class=""><?php echo e(__(config('global.mobile_info_title'))); ?></h2>
                <h4 class="mb-0 font-weight-light"><?php echo e(__(config('global.mobile_info_subtitle'))); ?></h4>
            </div>
            <div class="col-lg-6 text-lg-center btn-wrapper">
                <div class="row">
                    <?php if(config('global.playstore')): ?>
                    <div class="col-6">
                        <a href="<?php echo e(config('global.playstore')); ?>" target="_blank"><img class="img-fluid" src="/default/playstore.png" alt="..."/></a>
                    </div>
                    <?php endif; ?>
                    <?php if(config('global.appstore')): ?>
                    <div class="col-6">
                        <a href="<?php echo e(config('global.appstore')); ?>" target="_blank"><img class="img-fluid" src="/default/appstore.png" alt="..."/></a>
                    </div>
                    <?php endif; ?>
                </div>
            </div>
            </div>
        </div>
    </section>
<?php endif; ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('js'); ?>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=<?php echo env('GOOGLE_MAPS_API_KEY',''); ?>&libraries=places"></script>
    <script>
    "use strict";
    var IsplaceChange = false;
    $(document).ready(function () {
        var input = document.getElementById('txtlocation');
        var autocomplete = new google.maps.places.Autocomplete(input, {  });

        google.maps.event.addListener(autocomplete, 'place_changed', function () {
            var place = autocomplete.getPlace();

            IsplaceChange = true;
        });

        $("#txtlocation").keydown(function () {
            IsplaceChange = false;
        });

        $("#btnsubmit").on("click",function () {

            if (IsplaceChange == false) {
                $("#txtlocation").val('');
                alert("please Enter valid location");
            }
            else {
                alert($("#txtlocation").val());
            }

        });

        $("#search_location").on("click",function () {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    var pos = { lat: position.coords.latitude, lng: position.coords.longitude };

                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        }
                    });

                    $.ajax({
                        type:'POST',
                        url: '/search/location',
                        dataType: 'json',
                        data: {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude
                        },
                        success:function(response){
                            if(response.status){
                                $("#txtlocation").val(response.data.formatted_address);
                            }
                        }, error: function (response) {
                        }
                    })
                    }, function() {

                    });
                } else {
                // Browser doesn't support Geolocation
                //handleLocationError(false, infoWindow, map.getCenter());
            }
        });
    });
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.front', ['class' => ''], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /Users/danieldimov/Documents/Projects/Mobidonia/CodeCanyon/MRestorant/Site/resources/views/welcome.blade.php ENDPATH**/ ?>