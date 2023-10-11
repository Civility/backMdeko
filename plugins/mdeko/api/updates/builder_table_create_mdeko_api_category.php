<?php namespace Mdeko\Api\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class BuilderTableCreateMdekoApiCategory extends Migration
{
    public function up()
{
    Schema::create('mdeko_api_category', function($table)
    {
        $table->engine = 'InnoDB';
        $table->increments('id')->unsigned();
        $table->smallInteger('order')->default(0);
        $table->boolean('active')->default(1);
        $table->string('title')->nullable();
        $table->text('text')->nullable();
        $table->string('slug')->nullable();
        $table->string('img')->nullable();
        $table->string('icon')->nullable();
        $table->string('meta_title');
        $table->string('meta_desc');
        $table->timestamp('created_at')->nullable();
        $table->timestamp('updated_at')->nullable();
    });
}

public function down()
{
    Schema::dropIfExists('mdeko_api_category');
}
}