<?php



use App\Http\Controllers\API\StoreController;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\TransectionController;
use App\Http\Controllers\API\ReportController;
use Illuminate\Support\Facades\Route;

Route::get('users/checkauth', [UserController::class, 'checkauth']);
Route::post('login', [UserController::class, 'login']);
Route::post('register', [UserController::class, 'register']);
Route::post('logout', [UserController::class, 'logout'])->middleware('auth:sanctum');

Route::group(['prefix' => 'store', 'middleware' => 'auth:sanctum'], function () {
    Route::get('/', [StoreController::class, 'index']);
    Route::get('pos', [StoreController::class, 'pos']);
    Route::post('add', [StoreController::class, 'add']);
    Route::get('edit/{id}', [StoreController::class, 'edit']);
    Route::post('update/{id}', [StoreController::class, 'update']);
    Route::delete('delete/{id}', [StoreController::class, 'delete']);
});

Route::group(['prefix' => 'transection', 'middleware' => 'auth:sanctum'], function () {
    Route::post('/', [TransectionController::class, 'index']);
    Route::post('add', [TransectionController::class, 'add']);
    Route::get('edit/{id}', [TransectionController::class, 'edit']);
    Route::post('update/{id}', [TransectionController::class, 'update']);
    Route::delete('delete/{id}', [TransectionController::class, 'delete']);
});

Route::group(['prefix' => 'report', 'middleware' => 'auth:sanctum'], function () {
    Route::post('/', [ReportController::class, 'index']);
    Route::post('/dashgrap', [ReportController::class, 'DashGrap']);
});