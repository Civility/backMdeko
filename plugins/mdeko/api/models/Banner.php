<?php namespace Mdeko\Api\Models;

use Model;

/**
 * Model
 */
class Banner extends Model
{
    use \Winter\Storm\Database\Traits\Validation;
    use \Winter\Storm\Database\Traits\Sortable;
    const SORT_ORDER = 'order';

    /**
     * @var string The database table used by the model.
     */
    public $table = 'mdeko_api_banner';

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
