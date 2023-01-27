<?php

use App\Http\Controllers\CategoryController;
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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/category', [CategoryController::class, 'get_category'])->name('get-category');
Route::post('/save-category', [CategoryController::class, 'save_category'])->name('save-category');
Route::get('/delete-category/{id}', [CategoryController::class, 'delete_category'])->name('delete-category');
Route::post('/update-category/{id}', [CategoryController::class, 'update_category'])->name('update-category');

//test
Route::post('/save-product', [CategoryController::class, 'save_product'])->name('save-product');

//USING CUSTOM EVENT IN VUE
Route::get('/product', [CategoryController::class, 'get_product'])->name('get-product');
Route::get('/search-product/{queryFiled}/{query}', [CategoryController::class, 'search_product'])->name('search-product');
Route::post('/store-product', [CategoryController::class, 'store_product'])->name('store-product');
Route::get('/delete-product/{id}', [CategoryController::class, 'delete_product'])->name('delete-product');
Route::post('/update-product', [CategoryController::class, 'update_product'])->name('update-product');
Route::post('/another-update-product', [CategoryController::class, 'another_update_product'])->name('another-update-product');
