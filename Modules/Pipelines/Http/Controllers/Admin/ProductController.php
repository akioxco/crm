<?php

namespace Modules\Pipelines\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\Pipelines\Entities\Product;
use Modules\Pipelines\Http\Requests\CreateProductRequest;
use Modules\Pipelines\Http\Requests\UpdateProductRequest;
use Modules\Pipelines\Repositories\ProductRepository;
use Modules\Core\Http\Controllers\Admin\AdminBaseController;

class ProductController extends AdminBaseController
{
    /**
     * @var ProductRepository
     */
    private $product;

    public function __construct(ProductRepository $product)
    {
        parent::__construct();

        $this->product = $product;
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $products = $this->product->all();

        return view('pipelines::admin.products.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        return view('pipelines::admin.products.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CreateProductRequest $request
     * @return Response
     */
    public function store(CreateProductRequest $request)
    {
        $this->product->create($request->all());

        return redirect()->route('admin.pipelines.product.index')
            ->withSuccess(trans('core::core.messages.resource created', ['name' => trans('pipelines::products.title.products')]));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Product $product
     * @return Response
     */
    public function edit(Product $product)
    {
        return view('pipelines::admin.products.edit', compact('product'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Product $product
     * @param  UpdateProductRequest $request
     * @return Response
     */
    public function update(Product $product, UpdateProductRequest $request)
    {
        $this->product->update($product, $request->all());

        return redirect()->route('admin.pipelines.product.index')
            ->withSuccess(trans('core::core.messages.resource updated', ['name' => trans('pipelines::products.title.products')]));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Product $product
     * @return Response
     */
    public function destroy(Product $product)
    {
        $this->product->destroy($product);

        return redirect()->route('admin.pipelines.product.index')
            ->withSuccess(trans('core::core.messages.resource deleted', ['name' => trans('pipelines::products.title.products')]));
    }
}
