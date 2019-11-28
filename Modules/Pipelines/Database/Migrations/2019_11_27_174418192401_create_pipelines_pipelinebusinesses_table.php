<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePipelinesPipelineBusinessesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pipelines__pipelinebusinesses', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            
            $table->unsignedInteger('business_id')->nullable();
            $table->foreign('business_id')->references('id')->on('pipelines__businesses')->onDelete('cascade');

            $table->unsignedInteger('pipeline_id')->nullable();
            $table->foreign('pipeline_id')->references('id')->on('pipelines__pipelines')->onDelete('cascade');

            $table->text('description')->nullable();

            $table->date('date')->nullable();	

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
        Schema::dropIfExists('pipelines__pipelinebusinesses');
    }
}
