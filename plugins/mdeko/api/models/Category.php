<?php namespace Mdeko\Api\Models;

use Model;

/**
 * Model
 */
class Category extends Model
{
    use \Winter\Storm\Database\Traits\Validation;
		use \October\Rain\Database\Traits\Sortable;
    const SORT_ORDER = 'order';
    /*
     * Disable timestamps by default.
     * Remove this line if timestamps are defined in the database table.
     */
    public $timestamps = true;


    /**
     * @var string The database table used by the model.
     */
    public $table = 'mdeko_api_category';

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
