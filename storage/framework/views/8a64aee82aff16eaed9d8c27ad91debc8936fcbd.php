<div class="text-center" id="paypal-payment-form" style="display: <?php echo e(env('DEFAULT_PAYMENT','cod')=="paypal"?"block":"none"); ?>;" >
        <button
            v-if="totalPrice"
            type="submit"
            class="btn btn-success mt-4 paymentbutton"
            onclick="this.disabled=true;this.form.submit();"
        ><?php echo e(__('Place order')); ?></button>
    </div>


<?php /**PATH /home/magicqr/core.magicqr.nl/resources/views/cart/payments/paypal.blade.php ENDPATH**/ ?>