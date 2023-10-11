<?php namespace Mdeko\Api\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class BuilderTableCreateMdekoApiOrder extends Migration
{
    public function up()
{
    Schema::create('mdeko_api_order', function($table)
    {
        $table->engine = 'InnoDB';
        $table->increments('id')->unsigned();
        $table->timestamp('created_at')->nullable();
        $table->timestamp('updated_at')->nullable();
        $table->timestamp('deleted_at')->nullable();
        $table->integer('sum')->default(0);
        $table->string('clientid')->nullable();
        $table->smallInteger('orderid')->nullable();
        $table->integer('key')->nullable();
        $table->string('service_name')->nullable();
        $table->string('client_email')->nullable();
        $table->string('client_phone')->nullable();
        $table->integer('ps_id')->nullable();
        $table->date('batch_date')->nullable();
        $table->integer('fop_receipt_key')->nullable();
        $table->integer('bank_id')->nullable();
        $table->integer('card_number')->nullable();

        $table->string('card_holder')->nullable();
        $table->string('card_expiry')->nullable();
        $table->boolean('status')->default(1);
        $table->integer('item_id')->nullable();
             $table->text('message')->nullable();
                $table->string('city')->nullable();
                   $table->string('street')->nullable();
                      $table->string('houseNumber')->nullable();
                     $table->boolean('online_payment')->default(0);
                             $table->integer('delivery')->nullable();
    });
}

public function down()
{
    Schema::dropIfExists('mdeko_api_order');
}
}