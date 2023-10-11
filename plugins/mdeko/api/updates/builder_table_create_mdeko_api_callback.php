<?php namespace Mdeko\Api\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class BuilderTableCreateMdekoApiCallback extends Migration
{
    public function up()
{
    Schema::create('mdeko_api_callback', function($table)
    {
        $table->engine = 'InnoDB';
        $table->increments('id')->unsigned();
        $table->integer('ip')->nullable();
        $table->string('page')->nullable();
        $table->string('phone')->nullable();
        $table->text('text')->nullable();
        $table->string('email')->nullable();
        $table->string('name')->nullable();
        $table->timestamp('created_at')->nullable();
        $table->timestamp('updated_at')->nullable();
    });
}

public function down()
{
    Schema::dropIfExists('mdeko_api_callback');
}
}