<?php namespace App\Models;
 
use CodeIgniter\Model;
 
class Mpropta extends Model
{
    protected $table = 'tbl_propta';
    protected $primaryKey = 'idProp';
    protected $allowedFields = ['jdlTA','idMhs','pembSatu','pembDua','status','isProp','nrp','nama'];
}
