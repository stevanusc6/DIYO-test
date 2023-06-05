<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

class Sales extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'cart',
        'total',
        'created',
        'payment_method'
    ];

    protected function cart(): Attribute
    {
        return Attribute::make(
            get: fn ($cart) => json_decode($cart, true),
            set: fn ($cart) => json_encode($cart),
        );
    } 

    protected $hidden = [
        'created_at',
        'updated_at',
    ];
    protected $casts = [
        'id' => 'string',
        'created' => 'datetime:d M Y H:m:s'
    ];
}
