<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Inventory extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'price',
        'amount',
        'unit'
    ];
    protected $hidden = [
        'created_at',
        'updated_at',
    ];
    
}
