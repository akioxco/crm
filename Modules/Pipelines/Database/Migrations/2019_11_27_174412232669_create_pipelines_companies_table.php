<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePipelinesCompaniesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pipelines__companies', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('name')->nullable();
            $table->string('city')->nullable();

            $table->unsignedInteger('country_id')->nullable();
            $table->foreign('country_id')->references('id')->on('pipelines__countries')->onDelete('restrict');

            $table->string('web')->nullable();

            $table->unsignedInteger('source_id')->nullable();
            $table->foreign('source_id')->references('id')->on('pipelines__sources')->onDelete('restrict');

            $table->unsignedInteger('seller_id')->nullable();
            $table->foreign('seller_id')->references('id')->on('users')->onDelete('restrict');

            $table->string('type_id')->nullable();
            $table->string('identification')->nullable();
            $table->string('subdomain')->nullable();
            $table->string('email')->nullable();
            $table->string('phone')->nullable();
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
        Schema::dropIfExists('pipelines__companies');
    }
}
