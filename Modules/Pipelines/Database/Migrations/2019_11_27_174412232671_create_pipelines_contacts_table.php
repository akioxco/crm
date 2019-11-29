<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePipelinesContactsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pipelines__contacts', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('name');
            $table->string('last_name')->nullable();
            $table->string('email');
            $table->string('number_wa')->nullable();
            $table->string('phone')->nullable();

            $table->unsignedInteger('company_id')->nullable();
            $table->foreign('company_id')->references('id')->on('pipelines__companies')->onDelete('restrict');

            $table->string('web')->nullable();
            $table->string('city')->nullable();

            $table->unsignedInteger('country_id')->nullable();
            $table->foreign('country_id')->references('id')->on('pipelines__countries')->onDelete('restrict');
            
            $table->unsignedInteger('source_id')->nullable();
            $table->foreign('source_id')->references('id')->on('pipelines__sources')->onDelete('restrict');
            
            $table->unsignedInteger('seller_id')->nullable();
            $table->foreign('seller_id')->references('id')->on('users')->onDelete('restrict');
            
            $table->unsignedInteger('added_by')->nullable();
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
        Schema::dropIfExists('pipelines__contacts');
    }
}

