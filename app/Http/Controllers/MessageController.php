<?php

namespace App\Http\Controllers;

use App\Models\Message;
use Illuminate\Http\Request;

class MessageController extends Controller
{
    public function list($fromId, $toId)
    {
        dd(Message::getAllMessageList($fromId, $toId));
    }
}