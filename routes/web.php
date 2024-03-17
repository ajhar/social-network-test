<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\UserController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
Route::get("/", function(){
   dd("Please check readme file");
});
Route::get('/message/list/{from_id}/{to_id}',[MessageController::class, 'list']);
Route::get('/get_friends/{id}', [UserController::class, 'friendsOfUser']);
Route::get('/get_friends_of_friends/{id}', [UserController::class, 'friendsOfFriendsOfUser']);
