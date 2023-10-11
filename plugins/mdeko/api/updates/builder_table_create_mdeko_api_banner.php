<?php namespace Mdeko\Api\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class BuilderTableCreateMdekoApiBanner extends Migration
{
    public function up()
{
    Schema::create('mdeko_api_banner', function($table)
    {
        $table->engine = 'InnoDB';
        $table->increments('id')->unsigned();
        $table->timestamp('created_at')->nullable();
        $table->timestamp('updated_at')->nullable();
        $table->smallInteger('order')->default(0);
        $table->boolean('active')->default(1);
        $table->string('slug')->nullable();
        $table->text('text')->nullable();
        $table->string('title')->nullable();
        $table->string('img')->nullable();
        $table->string('icon')->nullable();
    });
}

public function down()
{
    Schema::dropIfExists('mdeko_api_banner');
}
}