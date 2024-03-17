<?php

namespace App\Models;

use App\Helpers\Traits\GeneralDatabaseOperation;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Friendship extends Model
{
    use HasFactory, GeneralDatabaseOperation;
    protected $table = "friendship";
    protected $fillable = [
        'user_id',
        'friend_id',
        'connected_on'
    ];
}
