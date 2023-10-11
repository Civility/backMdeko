<?php namespace Mdeko\Api\Models;

use Model;

/**
 * Model
 */
class Contacts extends Model
{
    use \Winter\Storm\Database\Traits\Validation;
		use \October\Rain\Database\Traits\Sortable;
    const SORT_ORDER = 'order';
		public $timestamps = true;
    /**
     * @var string The database table used by the model.
     */
    public $table = 'mdeko_api_contacts';

    /**
     * @var array Validation rules
     */
    public $rules = [
    ];
    
    /**
     * @var array Attribute names to encode and decode using JSON.
     */
    public $jsonable = ['social', 'city'];
}
