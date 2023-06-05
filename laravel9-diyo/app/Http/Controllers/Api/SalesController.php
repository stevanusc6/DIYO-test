<?php

namespace App\Http\Controllers\Api;

use App\Models\Sales;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\SalesResource;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;

class SalesController extends Controller
{
    //
    public function index(){
        $sales = Sales::all();
        return new SalesResource($sales);
    }

    public function store(Request $request){
        $validator = Validator::make($request->all(),[
            'id' => 'required',
            'cart' => 'required',
            'total' => 'required',
            'payment_method' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $cart=json_decode($request->cart);

        $sales = Sales::create([
            'id' => $request->id,
            'cart' => $cart,
            'total' => $request->total,
            'created' => Carbon::now(),
            'payment_method' => $request->payment_method
        ]);

        return new SalesResource($sales);
    }

    public function show($id) {
        $sales = Sales::find($id);
    
        return new SalesResource($sales);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(),[
            'id' => 'required',
            'cart' => 'required',
            'total' => 'required',
            'payment_method' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $sales = Sales::find($id);
        $cart=json_decode($request->cart);

        $sales = Sales::create([
            'id' => $request->id,
            'cart' => $cart,
            'total' => $request->total,
            'created' => Carbon::now(),
            'payment_method' => $request->payment_method
        ]);

        return new SalesResource($sales);
    }

    public function delete($id){
        $sales = Sales::find($id);
        $sales->delete();
        return new SalesResource($sales);
    }
}
