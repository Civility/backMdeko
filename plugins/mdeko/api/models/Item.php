<?php namespace Mdeko\Api\Models;

use Model;

/**
 * Model
 */
class Item extends Model
{
    use \Winter\Storm\Database\Traits\Validation;
    use \Winter\Storm\Database\Traits\Sortable;
    const SORT_ORDER = 'order';

    /**
     * @var string The database table used by the model.
     */
    public $table = 'mdeko_api_item';
		
    /**
     * @var array Validation rules
     */
    public $rules = [
    ];
		public $belongsTo = [
			// 'category' => 'Mdeko\Api\Models\Category',
      'category' => ['Mdeko\Api\Models\Category', 'key' => 'category_slug', 'otherKey' => 'slug']
		];
  /**
   * @var array Attribute names to encode and decode using JSON.
   */
  public $jsonable = ['slider'];

}
