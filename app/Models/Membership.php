<?php

namespace App\Models;

use App\Helpers\Traits\GeneralDatabaseOperation;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Membership extends Model
{
    use HasFactory, GeneralDatabaseOperation;
    protected $table = "memberships";
    protected $fillable = [
        'member_id',
        'group_id',
        'role',
    ];

    const ROLE_ADMIN = 1;
    const ROLE_MODERATOR = 2;
    const ROLE_MEMBER = 3;
}
