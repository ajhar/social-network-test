<?php

namespace App\Models;

use App\Helpers\Traits\GeneralDatabaseOperation;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    use HasFactory, GeneralDatabaseOperation;
    protected $table = "messages";
    protected $fillable = [
        'sender_id',
        'receiver_id',
        'content',
        'group_id',
    ];

    public function sender()
    {
        return $this->hasOne(User::class, 'id', 'sender_id');
    }

    public function receiver()
    {
        return $this->hasOne(User::class, 'receiver_id', 'id');
    }

    public static function getAllMessageList($fromUserId, $toUserId)
    {
        return self::query()
            ->with('sender')
            ->where(function($query) use ($fromUserId, $toUserId) {
                $query->where('sender_id', $fromUserId)
                    ->where('receiver_id', $toUserId);
            })
            ->orWhere(function($query) use ($fromUserId, $toUserId) {
                $query->where('sender_id', $toUserId)
                    ->where('receiver_id', $fromUserId);
            })
            ->orderBy('id')
            ->get(['content', 'sender_id']);
    }

}
