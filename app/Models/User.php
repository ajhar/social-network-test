<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Helpers\Traits\GeneralDatabaseOperation;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, GeneralDatabaseOperation;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'email',
        'password',
        'profile_picture_path',
        'last_name',
        'first_name'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    const ROLE_TEACHER = 'teacher';
    const ROLE_STUDENT = 'student';

    public function friendsOfUser()
    {
        return $this->belongsToMany(User::class, 'friendship', 'friend_id', 'user_id');
    }

    public function usersFriendOf()
    {
        return $this->belongsToMany(User::class, 'friendship', 'user_id', 'friend_id');
    }

    public function friend()
    {
        return $this->friendsOfUser->merge($this->usersFriendOf);
    }

    public function friendsOfFriends()
    {

        // Get the IDs of the user's friends
        $userFriendIds = $this->friend()->pluck('id');

        // Get the IDs of the friends of the user's friends (excluding the user)
        $friendsOfFriendsIds = User::whereIn('id', function ($query) use ($userFriendIds) {
            $query->select('friend_id')
                ->from('friendship')
                ->whereIn('user_id', $userFriendIds);
        })
            ->where('id', '!=', $this->id) // Exclude the user
            ->pluck('id')
            ->unique();

        // Retrieve the users who are friends of friends
        return User::whereIn('id', $friendsOfFriendsIds)->get();
    }

}
