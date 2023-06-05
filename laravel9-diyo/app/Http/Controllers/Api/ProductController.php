<?php

namespace App\Http\Controllers\Api;

use App\Models\Product;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\ProductResource;
use Illuminate\Support\Facades\Validator;


class ProductController extends Controller
{
    //
    public function index(){
        $product = Product::all();
        return new ProductResource($product);
    }

    public function store(Request $request){

        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'description' => 'required',
            'price' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        $variants=json_decode($request->variants);
  
        $product = Product::create([
            'name' => $request->name,
            'description' => $request->description,
            'price' => $request->price,
            'variants' => $variants
        ]);
       
        return new ProductResource($product);
    }

    public function show($id) {
        $product = Product::find($id);
        return new ProductResource($product);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'description' => 'required',
            'price' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $product = Product::find($id);

        $variants=json_decode($request->variants);
        
        $product->update([
            'name' => $request->name,
            'description' => $request->description,
            'price' => $request->price,
            'variants' => $variants
        ]);
        
        return new ProductResource($product);
    }

    public function delete($id){
        $product = Product::find($id);

        $product->delete();
        return new ProductResource($product);
    }
}
