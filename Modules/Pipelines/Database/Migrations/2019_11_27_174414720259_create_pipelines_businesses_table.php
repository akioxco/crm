<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePipelinesBusinessesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pipelines__businesses', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('name');

            $table->unsignedInteger('type_id')->nullable();
            $table->foreign('type_id')->references('id')->on('pipelines__typebusinesses')->onDelete('cascade');
        
            $table->unsignedInteger('contact_id')->nullable();
            $table->foreign('contact_id')->references('id')->on('pipelines__contacts')->onDelete('cascade');

            $table->unsignedInteger('seller_id')->nullable();
            $table->foreign('seller_id')->references('id')->on('users')->onDelete('restrict');

            
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
        Schema::dropIfExists('pipelines__businesses');
    }
}
