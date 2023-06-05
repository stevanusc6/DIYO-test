<?php

namespace App\Http\Controllers\Api;

use App\Models\Inventory;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\InventoryResource;
use App\Http\Resources\PostResource;
use Illuminate\Support\Facades\Validator;

class InventoryController extends Controller
{
    //
    public function index(){
        $inventory = Inventory::all();
        return new InventoryResource($inventory);
    }

    public function store(Request $request){
        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'price' => 'required',
            'amount' => 'required',
            'unit' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $inventory = Inventory::create([
            'name' => $request->name,
            'price' => $request->price,
            'amount' => $request->amount,
            'unit' => $request->unit
        ]);

        return new InventoryResource($inventory);
    }

    public function show($id) {
        $inventory = Inventory::find($id);
        return new InventoryResource($inventory);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'price' => 'required',
            'amount' => 'required',
            'unit' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $inventory = Inventory::find($id);

        $inventory->update([
            'name' => $request->name,
            'price' => $request->price,
            'amount' => $request->amount,
            'unit' => $request->unit
        ]);
        return new InventoryResource($inventory);
    }

    public function delete($id) {
        $inventory = Inventory::find($id);
        $inventory->delete();
        return new InventoryResource($inventory);
    }
}
