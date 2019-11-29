<?php

namespace Modules\Pipelines\Events\Handlers;

use Maatwebsite\Sidebar\Group;
use Maatwebsite\Sidebar\Item;
use Maatwebsite\Sidebar\Menu;
use Modules\Core\Events\BuildingSidebar;
use Modules\User\Contracts\Authentication;

class RegisterPipelinesSidebar implements \Maatwebsite\Sidebar\SidebarExtender
{
    /**
     * @var Authentication
     */
    protected $auth;

    /**
     * @param Authentication $auth
     *
     * @internal param Guard $guard
     */
    public function __construct(Authentication $auth)
    {
        $this->auth = $auth;
    }

    public function handle(BuildingSidebar $sidebar)
    {
        $sidebar->add($this->extendWith($sidebar->getMenu()));
    }

    /**
     * @param Menu $menu
     * @return Menu
     */
    public function extendWith(Menu $menu)
    {
        $menu->group(trans('core::sidebar.content'), function (Group $group) {
            $group->item(trans('pipelines::pipelines.title.pipelines'), function (Item $item) {
                $item->icon('fa fa-copy');
                $item->weight(10);
                $item->authorize(
                     /* append */
                );

                $item->item(trans('pipelines::countries.title.countries'), function (Item $item) {
                    $item->icon('fa fa-thumb-tack');
                    $item->weight(0);
                    $item->append('admin.pipelines.country.create');
                    $item->route('admin.pipelines.country.index');
                    $item->authorize(
                        $this->auth->hasAccess('pipelines.countries.index')
                    );
                });
                $item->item(trans('pipelines::contacts.title.contacts'), function (Item $item) {
                    $item->icon('fa fa-phone');
                    $item->weight(0);
                    $item->append('admin.pipelines.contact.create');
                    $item->route('admin.pipelines.contact.index');
                    $item->authorize(
                        $this->auth->hasAccess('pipelines.contacts.index')
                    );
                });
                $item->item(trans('pipelines::companies.title.companies'), function (Item $item) {
                    $item->icon('fa fa-building');
                    $item->weight(0);
                    $item->append('admin.pipelines.company.create');
                    $item->route('admin.pipelines.company.index');
                    $item->authorize(
                        $this->auth->hasAccess('pipelines.companies.index')
                    );
                });

                $item->item(trans('pipelines::businesses.title.businesses'), function (Item $item) {
                    $item->icon('fa fa-money');
                    $item->weight(0);
                    $item->append('admin.pipelines.business.create');
                    $item->route('admin.pipelines.business.index');
                    $item->authorize(
                        $this->auth->hasAccess('pipelines.businesses.index')
                    );
                });
                $item->item(trans('pipelines::products.title.products'), function (Item $item) {
                    $item->icon('fa fa-product-hunt');
                    $item->weight(0);
                    $item->append('admin.pipelines.product.create');
                    $item->route('admin.pipelines.product.index');
                    $item->authorize(
                        $this->auth->hasAccess('pipelines.products.index')
                    );
                });

                
// append












            });
        });

        return $menu;
    }
}
