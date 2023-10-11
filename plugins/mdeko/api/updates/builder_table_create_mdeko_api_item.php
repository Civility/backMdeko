<?php namespace Mdeko\Api\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class BuilderTableCreateMdekoApiItem extends Migration
{
    public function up()
{
    Schema::create('mdeko_api_item', function($table)
    {
        $table->engine = 'InnoDB';
        $table->increments('id')->unsigned();
        $table->integer('category_id')->nullable();
        $table->string('category_slug')->nullable();
        $table->timestamp('created_at')->nullable();
        $table->timestamp('updated_at')->nullable();
        $table->boolean('active')->default(1);
        $table->smallInteger('order')->default(0);
        $table->boolean('hit')->default(0);
        $table->string('slug')->nullable();
        $table->string('title')->nullable();
        $table->text('text')->nullable();
        $table->string('mini_text')->nullable();
        $table->text('slider')->nullable();
        $table->string('article')->nullable();
        $table->string('img')->nullable();
        $table->string('icon')->nullable();
        $table->string('url')->nullable();
        $table->string('price_min')->nullable();
        $table->string('price_max')->nullable();
        $table->string('composition')->nullable();
        $table->string('applications')->nullable();
        $table->string('storage')->nullable();
        $table->string('restriction')->nullable();
        $table->string('volum')->nullable();
        $table->smallInteger('weight_no_box')->nullable();
        $table->smallInteger('weight_box')->nullable();
        $table->smallInteger('height_box')->nullable();
        $table->smallInteger('width_box')->nullable();
        $table->string('best_before_date')->nullable;
        $table->string('action')->nullable();
        $table->string('purpose')->nullable();
        $table->string('reserve_1')->nullable();
        $table->string('reserve_2')->nullable();
        $table->string('reserve_3')->nullable();
        $table->string('reserve_4')->nullable();
        $table->string('reserve_5')->nullable();
        $table->string('meta_title');
        $table->string('meta_desc');
    });
}

public function down()
{
    Schema::dropIfExists('mdeko_api_item');
}
}