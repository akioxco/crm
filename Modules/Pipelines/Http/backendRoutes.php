<?php

use Illuminate\Routing\Router;
/** @var Router $router */

$router->group(['prefix' =>'/pipelines'], function (Router $router) {
    $router->bind('source', function ($id) {
        return app('Modules\Pipelines\Repositories\SourceRepository')->find($id);
    });
    $router->get('sources', [
        'as' => 'admin.pipelines.source.index',
        'uses' => 'SourceController@index',
        'middleware' => 'can:pipelines.sources.index'
    ]);
    $router->get('sources/create', [
        'as' => 'admin.pipelines.source.create',
        'uses' => 'SourceController@create',
        'middleware' => 'can:pipelines.sources.create'
    ]);
    $router->post('sources', [
        'as' => 'admin.pipelines.source.store',
        'uses' => 'SourceController@store',
        'middleware' => 'can:pipelines.sources.create'
    ]);
    $router->get('sources/{source}/edit', [
        'as' => 'admin.pipelines.source.edit',
        'uses' => 'SourceController@edit',
        'middleware' => 'can:pipelines.sources.edit'
    ]);
    $router->put('sources/{source}', [
        'as' => 'admin.pipelines.source.update',
        'uses' => 'SourceController@update',
        'middleware' => 'can:pipelines.sources.edit'
    ]);
    $router->delete('sources/{source}', [
        'as' => 'admin.pipelines.source.destroy',
        'uses' => 'SourceController@destroy',
        'middleware' => 'can:pipelines.sources.destroy'
    ]);
    $router->bind('country', function ($id) {
        return app('Modules\Pipelines\Repositories\CountryRepository')->find($id);
    });
    $router->get('countries', [
        'as' => 'admin.pipelines.country.index',
        'uses' => 'CountryController@index',
        'middleware' => 'can:pipelines.countries.index'
    ]);
    $router->get('countries/create', [
        'as' => 'admin.pipelines.country.create',
        'uses' => 'CountryController@create',
        'middleware' => 'can:pipelines.countries.create'
    ]);
    $router->post('countries', [
        'as' => 'admin.pipelines.country.store',
        'uses' => 'CountryController@store',
        'middleware' => 'can:pipelines.countries.create'
    ]);
    $router->get('countries/{country}/edit', [
        'as' => 'admin.pipelines.country.edit',
        'uses' => 'CountryController@edit',
        'middleware' => 'can:pipelines.countries.edit'
    ]);
    $router->put('countries/{country}', [
        'as' => 'admin.pipelines.country.update',
        'uses' => 'CountryController@update',
        'middleware' => 'can:pipelines.countries.edit'
    ]);
    $router->delete('countries/{country}', [
        'as' => 'admin.pipelines.country.destroy',
        'uses' => 'CountryController@destroy',
        'middleware' => 'can:pipelines.countries.destroy'
    ]);
    $router->bind('contact', function ($id) {
        return app('Modules\Pipelines\Repositories\ContactRepository')->find($id);
    });
    $router->get('contacts', [
        'as' => 'admin.pipelines.contact.index',
        'uses' => 'ContactController@index',
        'middleware' => 'can:pipelines.contacts.index'
    ]);
    $router->get('contacts/create', [
        'as' => 'admin.pipelines.contact.create',
        'uses' => 'ContactController@create',
        'middleware' => 'can:pipelines.contacts.create'
    ]);
    $router->post('contacts', [
        'as' => 'admin.pipelines.contact.store',
        'uses' => 'ContactController@store',
        'middleware' => 'can:pipelines.contacts.create'
    ]);
    $router->get('contacts/{contact}/edit', [
        'as' => 'admin.pipelines.contact.edit',
        'uses' => 'ContactController@edit',
        'middleware' => 'can:pipelines.contacts.edit'
    ]);
    $router->put('contacts/{contact}', [
        'as' => 'admin.pipelines.contact.update',
        'uses' => 'ContactController@update',
        'middleware' => 'can:pipelines.contacts.edit'
    ]);
    $router->delete('contacts/{contact}', [
        'as' => 'admin.pipelines.contact.destroy',
        'uses' => 'ContactController@destroy',
        'middleware' => 'can:pipelines.contacts.destroy'
    ]);
    $router->bind('company', function ($id) {
        return app('Modules\Pipelines\Repositories\CompanyRepository')->find($id);
    });
    $router->get('companies', [
        'as' => 'admin.pipelines.company.index',
        'uses' => 'CompanyController@index',
        'middleware' => 'can:pipelines.companies.index'
    ]);
    $router->get('companies/create', [
        'as' => 'admin.pipelines.company.create',
        'uses' => 'CompanyController@create',
        'middleware' => 'can:pipelines.companies.create'
    ]);
    $router->post('companies', [
        'as' => 'admin.pipelines.company.store',
        'uses' => 'CompanyController@store',
        'middleware' => 'can:pipelines.companies.create'
    ]);
    $router->get('companies/{company}/edit', [
        'as' => 'admin.pipelines.company.edit',
        'uses' => 'CompanyController@edit',
        'middleware' => 'can:pipelines.companies.edit'
    ]);
    $router->put('companies/{company}', [
        'as' => 'admin.pipelines.company.update',
        'uses' => 'CompanyController@update',
        'middleware' => 'can:pipelines.companies.edit'
    ]);
    $router->delete('companies/{company}', [
        'as' => 'admin.pipelines.company.destroy',
        'uses' => 'CompanyController@destroy',
        'middleware' => 'can:pipelines.companies.destroy'
    ]);
    $router->bind('typebusiness', function ($id) {
        return app('Modules\Pipelines\Repositories\TypeBusinessRepository')->find($id);
    });
    $router->get('typebusinesses', [
        'as' => 'admin.pipelines.typebusiness.index',
        'uses' => 'TypeBusinessController@index',
        'middleware' => 'can:pipelines.typebusinesses.index'
    ]);
    $router->get('typebusinesses/create', [
        'as' => 'admin.pipelines.typebusiness.create',
        'uses' => 'TypeBusinessController@create',
        'middleware' => 'can:pipelines.typebusinesses.create'
    ]);
    $router->post('typebusinesses', [
        'as' => 'admin.pipelines.typebusiness.store',
        'uses' => 'TypeBusinessController@store',
        'middleware' => 'can:pipelines.typebusinesses.create'
    ]);
    $router->get('typebusinesses/{typebusiness}/edit', [
        'as' => 'admin.pipelines.typebusiness.edit',
        'uses' => 'TypeBusinessController@edit',
        'middleware' => 'can:pipelines.typebusinesses.edit'
    ]);
    $router->put('typebusinesses/{typebusiness}', [
        'as' => 'admin.pipelines.typebusiness.update',
        'uses' => 'TypeBusinessController@update',
        'middleware' => 'can:pipelines.typebusinesses.edit'
    ]);
    $router->delete('typebusinesses/{typebusiness}', [
        'as' => 'admin.pipelines.typebusiness.destroy',
        'uses' => 'TypeBusinessController@destroy',
        'middleware' => 'can:pipelines.typebusinesses.destroy'
    ]);
    $router->bind('business', function ($id) {
        return app('Modules\Pipelines\Repositories\BusinessRepository')->find($id);
    });
    $router->get('businesses', [
        'as' => 'admin.pipelines.business.index',
        'uses' => 'BusinessController@index',
        'middleware' => 'can:pipelines.businesses.index'
    ]);
    $router->get('businesses/create', [
        'as' => 'admin.pipelines.business.create',
        'uses' => 'BusinessController@create',
        'middleware' => 'can:pipelines.businesses.create'
    ]);
    $router->post('businesses', [
        'as' => 'admin.pipelines.business.store',
        'uses' => 'BusinessController@store',
        'middleware' => 'can:pipelines.businesses.create'
    ]);
    $router->get('businesses/{business}/edit', [
        'as' => 'admin.pipelines.business.edit',
        'uses' => 'BusinessController@edit',
        'middleware' => 'can:pipelines.businesses.edit'
    ]);
    $router->put('businesses/{business}', [
        'as' => 'admin.pipelines.business.update',
        'uses' => 'BusinessController@update',
        'middleware' => 'can:pipelines.businesses.edit'
    ]);
    $router->delete('businesses/{business}', [
        'as' => 'admin.pipelines.business.destroy',
        'uses' => 'BusinessController@destroy',
        'middleware' => 'can:pipelines.businesses.destroy'
    ]);
    $router->bind('product', function ($id) {
        return app('Modules\Pipelines\Repositories\ProductRepository')->find($id);
    });
    $router->get('products', [
        'as' => 'admin.pipelines.product.index',
        'uses' => 'ProductController@index',
        'middleware' => 'can:pipelines.products.index'
    ]);
    $router->get('products/create', [
        'as' => 'admin.pipelines.product.create',
        'uses' => 'ProductController@create',
        'middleware' => 'can:pipelines.products.create'
    ]);
    $router->post('products', [
        'as' => 'admin.pipelines.product.store',
        'uses' => 'ProductController@store',
        'middleware' => 'can:pipelines.products.create'
    ]);
    $router->get('products/{product}/edit', [
        'as' => 'admin.pipelines.product.edit',
        'uses' => 'ProductController@edit',
        'middleware' => 'can:pipelines.products.edit'
    ]);
    $router->put('products/{product}', [
        'as' => 'admin.pipelines.product.update',
        'uses' => 'ProductController@update',
        'middleware' => 'can:pipelines.products.edit'
    ]);
    $router->delete('products/{product}', [
        'as' => 'admin.pipelines.product.destroy',
        'uses' => 'ProductController@destroy',
        'middleware' => 'can:pipelines.products.destroy'
    ]);
    $router->bind('detailbusiness', function ($id) {
        return app('Modules\Pipelines\Repositories\DetailBusinessRepository')->find($id);
    });
    $router->get('detailbusinesses', [
        'as' => 'admin.pipelines.detailbusiness.index',
        'uses' => 'DetailBusinessController@index',
        'middleware' => 'can:pipelines.detailbusinesses.index'
    ]);
    $router->get('detailbusinesses/create', [
        'as' => 'admin.pipelines.detailbusiness.create',
        'uses' => 'DetailBusinessController@create',
        'middleware' => 'can:pipelines.detailbusinesses.create'
    ]);
    $router->post('detailbusinesses', [
        'as' => 'admin.pipelines.detailbusiness.store',
        'uses' => 'DetailBusinessController@store',
        'middleware' => 'can:pipelines.detailbusinesses.create'
    ]);
    $router->get('detailbusinesses/{detailbusiness}/edit', [
        'as' => 'admin.pipelines.detailbusiness.edit',
        'uses' => 'DetailBusinessController@edit',
        'middleware' => 'can:pipelines.detailbusinesses.edit'
    ]);
    $router->put('detailbusinesses/{detailbusiness}', [
        'as' => 'admin.pipelines.detailbusiness.update',
        'uses' => 'DetailBusinessController@update',
        'middleware' => 'can:pipelines.detailbusinesses.edit'
    ]);
    $router->delete('detailbusinesses/{detailbusiness}', [
        'as' => 'admin.pipelines.detailbusiness.destroy',
        'uses' => 'DetailBusinessController@destroy',
        'middleware' => 'can:pipelines.detailbusinesses.destroy'
    ]);
    $router->bind('pipeline', function ($id) {
        return app('Modules\Pipelines\Repositories\PipelineRepository')->find($id);
    });
    $router->get('pipelines', [
        'as' => 'admin.pipelines.pipeline.index',
        'uses' => 'PipelineController@index',
        'middleware' => 'can:pipelines.pipelines.index'
    ]);
    $router->get('pipelines/create', [
        'as' => 'admin.pipelines.pipeline.create',
        'uses' => 'PipelineController@create',
        'middleware' => 'can:pipelines.pipelines.create'
    ]);
    $router->post('pipelines', [
        'as' => 'admin.pipelines.pipeline.store',
        'uses' => 'PipelineController@store',
        'middleware' => 'can:pipelines.pipelines.create'
    ]);
    $router->get('pipelines/{pipeline}/edit', [
        'as' => 'admin.pipelines.pipeline.edit',
        'uses' => 'PipelineController@edit',
        'middleware' => 'can:pipelines.pipelines.edit'
    ]);
    $router->put('pipelines/{pipeline}', [
        'as' => 'admin.pipelines.pipeline.update',
        'uses' => 'PipelineController@update',
        'middleware' => 'can:pipelines.pipelines.edit'
    ]);
    $router->delete('pipelines/{pipeline}', [
        'as' => 'admin.pipelines.pipeline.destroy',
        'uses' => 'PipelineController@destroy',
        'middleware' => 'can:pipelines.pipelines.destroy'
    ]);
    $router->bind('pipelinebusiness', function ($id) {
        return app('Modules\Pipelines\Repositories\PipelineBusinessRepository')->find($id);
    });
    $router->get('pipelinebusinesses', [
        'as' => 'admin.pipelines.pipelinebusiness.index',
        'uses' => 'PipelineBusinessController@index',
        'middleware' => 'can:pipelines.pipelinebusinesses.index'
    ]);
    $router->get('pipelinebusinesses/create', [
        'as' => 'admin.pipelines.pipelinebusiness.create',
        'uses' => 'PipelineBusinessController@create',
        'middleware' => 'can:pipelines.pipelinebusinesses.create'
    ]);
    $router->post('pipelinebusinesses', [
        'as' => 'admin.pipelines.pipelinebusiness.store',
        'uses' => 'PipelineBusinessController@store',
        'middleware' => 'can:pipelines.pipelinebusinesses.create'
    ]);
    $router->get('pipelinebusinesses/{pipelinebusiness}/edit', [
        'as' => 'admin.pipelines.pipelinebusiness.edit',
        'uses' => 'PipelineBusinessController@edit',
        'middleware' => 'can:pipelines.pipelinebusinesses.edit'
    ]);
    $router->put('pipelinebusinesses/{pipelinebusiness}', [
        'as' => 'admin.pipelines.pipelinebusiness.update',
        'uses' => 'PipelineBusinessController@update',
        'middleware' => 'can:pipelines.pipelinebusinesses.edit'
    ]);
    $router->delete('pipelinebusinesses/{pipelinebusiness}', [
        'as' => 'admin.pipelines.pipelinebusiness.destroy',
        'uses' => 'PipelineBusinessController@destroy',
        'middleware' => 'can:pipelines.pipelinebusinesses.destroy'
    ]);
    $router->bind('phone', function ($id) {
        return app('Modules\Pipelines\Repositories\PhoneRepository')->find($id);
    });
    $router->get('phones', [
        'as' => 'admin.pipelines.phone.index',
        'uses' => 'PhoneController@index',
        'middleware' => 'can:pipelines.phones.index'
    ]);
    $router->get('phones/create', [
        'as' => 'admin.pipelines.phone.create',
        'uses' => 'PhoneController@create',
        'middleware' => 'can:pipelines.phones.create'
    ]);
    $router->post('phones', [
        'as' => 'admin.pipelines.phone.store',
        'uses' => 'PhoneController@store',
        'middleware' => 'can:pipelines.phones.create'
    ]);
    $router->get('phones/{phone}/edit', [
        'as' => 'admin.pipelines.phone.edit',
        'uses' => 'PhoneController@edit',
        'middleware' => 'can:pipelines.phones.edit'
    ]);
    $router->put('phones/{phone}', [
        'as' => 'admin.pipelines.phone.update',
        'uses' => 'PhoneController@update',
        'middleware' => 'can:pipelines.phones.edit'
    ]);
    $router->delete('phones/{phone}', [
        'as' => 'admin.pipelines.phone.destroy',
        'uses' => 'PhoneController@destroy',
        'middleware' => 'can:pipelines.phones.destroy'
    ]);
    $router->bind('email', function ($id) {
        return app('Modules\Pipelines\Repositories\EmailRepository')->find($id);
    });
    $router->get('emails', [
        'as' => 'admin.pipelines.email.index',
        'uses' => 'EmailController@index',
        'middleware' => 'can:pipelines.emails.index'
    ]);
    $router->get('emails/create', [
        'as' => 'admin.pipelines.email.create',
        'uses' => 'EmailController@create',
        'middleware' => 'can:pipelines.emails.create'
    ]);
    $router->post('emails', [
        'as' => 'admin.pipelines.email.store',
        'uses' => 'EmailController@store',
        'middleware' => 'can:pipelines.emails.create'
    ]);
    $router->get('emails/{email}/edit', [
        'as' => 'admin.pipelines.email.edit',
        'uses' => 'EmailController@edit',
        'middleware' => 'can:pipelines.emails.edit'
    ]);
    $router->put('emails/{email}', [
        'as' => 'admin.pipelines.email.update',
        'uses' => 'EmailController@update',
        'middleware' => 'can:pipelines.emails.edit'
    ]);
    $router->delete('emails/{email}', [
        'as' => 'admin.pipelines.email.destroy',
        'uses' => 'EmailController@destroy',
        'middleware' => 'can:pipelines.emails.destroy'
    ]);
// append












});
