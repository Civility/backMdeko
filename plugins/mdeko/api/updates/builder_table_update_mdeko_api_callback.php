<?php namespace Mdeko\Api\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class BuilderTableUpdateMdekoApiCallback extends Migration
{
    public function up()
{
    Schema::table('mdeko_api_callback', function($table)
    {
        $table->string('ip', 191)->nullable()->unsigned(false)->default(null)->change();
    });
}

public function down()
{
    Schema::table('mdeko_api_callback', function($table)
    {
        $table->integer('ip')->nullable()->unsigned(false)->default(null)->change();
    });
}
}
