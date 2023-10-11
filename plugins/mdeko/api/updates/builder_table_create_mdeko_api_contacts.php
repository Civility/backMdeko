<?php namespace Mdeko\Api\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class BuilderTableCreateMdekoApiContacts extends Migration
{
    public function up()
{
    Schema::create('mdeko_api_contacts', function($table)
    {
        $table->engine = 'InnoDB';
        $table->increments('id')->unsigned();
        $table->string('email')->nullable();
        $table->string('address')->nullable();
        $table->text('city')->nullable();
        $table->text('social')->nullable();
        $table->string('icon')->nullable();
        $table->boolean('active')->default(1);
        $table->smallInteger('order')->default(0);
        $table->timestamp('created_at')->nullable();
        $table->timestamp('updated_at')->nullable();
    });
}

public function down()
{
    Schema::dropIfExists('mdeko_api_contacts');
}
}