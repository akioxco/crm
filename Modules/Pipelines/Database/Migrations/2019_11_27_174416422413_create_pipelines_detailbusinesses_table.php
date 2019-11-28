<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePipelinesDetailBusinessesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pipelines__detailbusinesses', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            
            $table->unsignedInteger('business_id')->nullable();
            $table->foreign('business_id')->references('id')->on('pipelines__businesses')->onDelete('cascade');

            $table->unsignedInteger('product_id')->nullable();
            $table->foreign('product_id')->references('id')->on('pipelines__products')->onDelete('cascade');

            $table->integer('quantity');

            $table->float('value');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pipelines__detailbusinesses');
    }
}
