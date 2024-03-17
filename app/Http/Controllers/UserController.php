<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function friendsOfUser($user_id)
    {
       $user = User::query()
            ->where('id', '=', $user_id)
            ->first();
       dd($user->friend());
    }

    public function friendsOfFriendsOfUser($user_id)
    {
        $user = User::find($user_id);
        dd($user->friendsOfFriends());
    }
}


