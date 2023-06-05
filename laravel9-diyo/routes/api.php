<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/register', [App\Http\Controllers\API\AuthController::class, 'register']);

Route::post('/login', [App\Http\Controllers\API\AuthController::class, 'login']);
Route::post('/logout', [App\Http\Controllers\API\AuthController::class, 'logout']);

Route::apiResource('/inventories', App\Http\Controllers\Api\InventoryController::class)->middleware('auth:api');
Route::apiResource('/products', App\Http\Controllers\Api\ProductController::class)->middleware('auth:api');
Route::apiResource('/sales', App\Http\Controllers\Api\SalesController::class)->middleware('auth:api');