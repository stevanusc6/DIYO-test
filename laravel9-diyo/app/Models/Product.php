<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'price',
        'variants'
    ];

    protected function variants(): Attribute
    {
        return Attribute::make(
            get: fn ($variants) => json_decode($variants, true),
            set: fn ($variants) => json_encode($variants),
        );
    } 

    protected $hidden = [
        'created_at',
        'updated_at',
    ];
}
