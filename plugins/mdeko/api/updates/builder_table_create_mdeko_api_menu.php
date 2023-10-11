<?php namespace Mdeko\Api\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class BuilderTableCreateMdekoApiMenu extends Migration
{
    public function up()
{
    Schema::create('mdeko_api_menu', function($table)
    {
        $table->engine = 'InnoDB';
        $table->increments('id')->unsigned();
        $table->timestamp('created_at')->nullable();
        $table->timestamp('updated_at')->nullable();
        $table->smallInteger('order')->default(0);
        $table->string('slug');
        $table->string('title');
        $table->string('img')->nullable();
        $table->string('icon')->nullable();
        $table->string('meta_title');
        $table->string('meta_desc');
        $table->boolean('active')->default(1);
    });
}

public function down()
{
    Schema::dropIfExists('mdeko_api_menu');
}
}