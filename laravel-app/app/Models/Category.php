<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    protected $fillable = ['name','status'];

    public function scopeActive($query,$status){
        $query->whereIn('status',$status);
    }

    public function scopeOrderShow($query)
    {
        $query->orderBy('id','desc');
    }

}
