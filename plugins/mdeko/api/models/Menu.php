<?php namespace Mdeko\Api\Models;

use Model;

/**
 * Model
 */
class Menu extends Model
{
    use \Winter\Storm\Database\Traits\Validation;
    use \Winter\Storm\Database\Traits\Sortable;
    const SORT_ORDER = 'order';
    /**
     * @var string The database table used by the model.
     */
    public $table = 'mdeko_api_menu';

    /**
     * @var array Validation rules
     */
    public $rules = [
 
    ];
    
    /**
     * @var array Attribute names to encode and decode using JSON.
     */
    public $jsonable = [];
}
