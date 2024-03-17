<?php

namespace App\Models;

use App\Helpers\Traits\GeneralDatabaseOperation;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    use HasFactory, GeneralDatabaseOperation;
    protected $table = "groups";
    protected $fillable = [
        'name',
        'visibility',
        'creator_id'
    ];

    const VISIBILITY_PRIVATE = 0;
    const VISIBILITY_PUBLIC = 1;
}
