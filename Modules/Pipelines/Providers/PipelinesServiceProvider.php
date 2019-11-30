<?php

namespace Modules\Pipelines\Providers;

use Illuminate\Support\ServiceProvider;
use Modules\Core\Traits\CanPublishConfiguration;
use Modules\Core\Events\BuildingSidebar;
use Modules\Core\Events\LoadingBackendTranslations;
use Modules\Pipelines\Events\Handlers\RegisterPipelinesSidebar;

class PipelinesServiceProvider extends ServiceProvider
{
    use CanPublishConfiguration;
    /**
     * Indicates if loading of the provider is deferred.
     *
     * @var bool
     */
    protected $defer = false;

    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        $this->registerBindings();
        $this->app['events']->listen(BuildingSidebar::class, RegisterPipelinesSidebar::class);

        $this->app['events']->listen(LoadingBackendTranslations::class, function (LoadingBackendTranslations $event) {
            $event->load('sources', array_dot(trans('pipelines::sources')));
            $event->load('countries', array_dot(trans('pipelines::countries')));
            $event->load('contacts', array_dot(trans('pipelines::contacts')));
            $event->load('companies', array_dot(trans('pipelines::companies')));
            $event->load('typebusinesses', array_dot(trans('pipelines::typebusinesses')));
            $event->load('businesses', array_dot(trans('pipelines::businesses')));
            $event->load('products', array_dot(trans('pipelines::products')));
            $event->load('detailbusinesses', array_dot(trans('pipelines::detailbusinesses')));
            $event->load('pipelines', array_dot(trans('pipelines::pipelines')));
            $event->load('pipelinebusinesses', array_dot(trans('pipelines::pipelinebusinesses')));
            $event->load('phones', array_dot(trans('pipelines::phones')));
            $event->load('emails', array_dot(trans('pipelines::emails')));
            $event->load('notes', array_dot(trans('pipelines::notes')));
            // append translations













        });
    }

    public function boot()
    {
        $this->publishConfig('pipelines', 'permissions');

        $this->loadMigrationsFrom(__DIR__ . '/../Database/Migrations');
    }

    /**
     * Get the services provided by the provider.
     *
     * @return array
     */
    public function provides()
    {
        return array();
    }

    private function registerBindings()
    {
        $this->app->bind(
            'Modules\Pipelines\Repositories\SourceRepository',
            function () {
                $repository = new \Modules\Pipelines\Repositories\Eloquent\EloquentSourceRepository(new \Modules\Pipelines\Entities\Source());

                if (! config('app.cache')) {
                    return $repository;
                }

                return new \Modules\Pipelines\Repositories\Cache\CacheSourceDecorator($repository);
            }
        );
        $this->app->bind(
            'Modules\Pipelines\Repositories\CountryRepository',
            function () {
                $repository = new \Modules\Pipelines\Repositories\Eloquent\EloquentCountryRepository(new \Modules\Pipelines\Entities\Country());

                if (! config('app.cache')) {
                    return $repository;
                }

                return new \Modules\Pipelines\Repositories\Cache\CacheCountryDecorator($repository);
            }
        );
        $this->app->bind(
            'Modules\Pipelines\Repositories\ContactRepository',
            function () {
                $repository = new \Modules\Pipelines\Repositories\Eloquent\EloquentContactRepository(new \Modules\Pipelines\Entities\Contact());

                if (! config('app.cache')) {
                    return $repository;
                }

                return new \Modules\Pipelines\Repositories\Cache\CacheContactDecorator($repository);
            }
        );
        $this->app->bind(
            'Modules\Pipelines\Repositories\CompanyRepository',
            function () {
                $repository = new \Modules\Pipelines\Repositories\Eloquent\EloquentCompanyRepository(new \Modules\Pipelines\Entities\Company());

                if (! config('app.cache')) {
                    return $repository;
                }

                return new \Modules\Pipelines\Repositories\Cache\CacheCompanyDecorator($repository);
            }
        );
        $this->app->bind(
            'Modules\Pipelines\Repositories\TypeBusinessRepository',
            function () {
                $repository = new \Modules\Pipelines\Repositories\Eloquent\EloquentTypeBusinessRepository(new \Modules\Pipelines\Entities\TypeBusiness());

                if (! config('app.cache')) {
                    return $repository;
                }

                return new \Modules\Pipelines\Repositories\Cache\CacheTypeBusinessDecorator($repository);
            }
        );
        $this->app->bind(
            'Modules\Pipelines\Repositories\BusinessRepository',
            function () {
                $repository = new \Modules\Pipelines\Repositories\Eloquent\EloquentBusinessRepository(new \Modules\Pipelines\Entities\Business());

                if (! config('app.cache')) {
                    return $repository;
                }

                return new \Modules\Pipelines\Repositories\Cache\CacheBusinessDecorator($repository);
            }
        );
        $this->app->bind(
            'Modules\Pipelines\Repositories\ProductRepository',
            function () {
                $repository = new \Modules\Pipelines\Repositories\Eloquent\EloquentProductRepository(new \Modules\Pipelines\Entities\Product());

                if (! config('app.cache')) {
                    return $repository;
                }

                return new \Modules\Pipelines\Repositories\Cache\CacheProductDecorator($repository);
            }
        );
        $this->app->bind(
            'Modules\Pipelines\Repositories\DetailBusinessRepository',
            function () {
                $repository = new \Modules\Pipelines\Repositories\Eloquent\EloquentDetailBusinessRepository(new \Modules\Pipelines\Entities\DetailBusiness());

                if (! config('app.cache')) {
                    return $repository;
                }

                return new \Modules\Pipelines\Repositories\Cache\CacheDetailBusinessDecorator($repository);
            }
        );
        $this->app->bind(
            'Modules\Pipelines\Repositories\PipelineRepository',
            function () {
                $repository = new \Modules\Pipelines\Repositories\Eloquent\EloquentPipelineRepository(new \Modules\Pipelines\Entities\Pipeline());

                if (! config('app.cache')) {
                    return $repository;
                }

                return new \Modules\Pipelines\Repositories\Cache\CachePipelineDecorator($repository);
            }
        );
        $this->app->bind(
            'Modules\Pipelines\Repositories\PipelineBusinessRepository',
            function () {
                $repository = new \Modules\Pipelines\Repositories\Eloquent\EloquentPipelineBusinessRepository(new \Modules\Pipelines\Entities\PipelineBusiness());

                if (! config('app.cache')) {
                    return $repository;
                }

                return new \Modules\Pipelines\Repositories\Cache\CachePipelineBusinessDecorator($repository);
            }
        );
        $this->app->bind(
            'Modules\Pipelines\Repositories\PhoneRepository',
            function () {
                $repository = new \Modules\Pipelines\Repositories\Eloquent\EloquentPhoneRepository(new \Modules\Pipelines\Entities\Phone());

                if (! config('app.cache')) {
                    return $repository;
                }

                return new \Modules\Pipelines\Repositories\Cache\CachePhoneDecorator($repository);
            }
        );
        $this->app->bind(
            'Modules\Pipelines\Repositories\EmailRepository',
            function () {
                $repository = new \Modules\Pipelines\Repositories\Eloquent\EloquentEmailRepository(new \Modules\Pipelines\Entities\Email());

                if (! config('app.cache')) {
                    return $repository;
                }

                return new \Modules\Pipelines\Repositories\Cache\CacheEmailDecorator($repository);
            }
        );
        $this->app->bind(
            'Modules\Pipelines\Repositories\NoteRepository',
            function () {
                $repository = new \Modules\Pipelines\Repositories\Eloquent\EloquentNoteRepository(new \Modules\Pipelines\Entities\Note());

                if (! config('app.cache')) {
                    return $repository;
                }

                return new \Modules\Pipelines\Repositories\Cache\CacheNoteDecorator($repository);
            }
        );
// add bindings













    }
}
