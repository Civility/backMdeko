
<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Mdeko\Api\Models\Menu;
use Mdeko\Api\Models\Banner;
use Mdeko\Api\Models\Contacts;
use Mdeko\Api\Models\Callback;
use Mdeko\Api\Models\Category;
use Mdeko\Api\Models\Item;
use Mdeko\Api\Models\Order;

require __DIR__.'/helpers/helper.php';

 
Route::get('api/menu', function () {
 $selectColumns = ['title', 'slug', 'img', 'icon', 'meta_title', 'meta_desc'];
    $data = getCachedData('cached_menu', function () use ($selectColumns) {
        return Menu::where('active', 1)
            ->select($selectColumns)
            ->orderBy('order', 'asc')
            ->get();
    });
    $filteredData = removeEmptyValues($data);
    return $filteredData;
});

Route::get('api/contact', function () {
    $selectColumns = ['email', 'address', 'city' ];
    $data = getCachedData('cached_contact', function () use ($selectColumns) {
        return Contacts::where('active', 1)
            ->select($selectColumns)
            ->orderBy('order', 'asc')
            ->get();
    });
    $filteredData = removeEmptyValues($data);
    return $filteredData[0];
});

Route::get('api/banner', function () {
    $selectColumns = ['title', 'slug', 'text', 'img', 'icon'];
    $data = getCachedData('cached_banner', function () use ($selectColumns) {
        return Banner::where('active', 1)
            ->select($selectColumns)
            ->orderBy('order', 'asc')
            ->get();
    });
    $filteredData = removeEmptyValues($data);
    return $filteredData;
});

Route::get('api/catalog', function () {
  $selectColumns = ['id','title', 'slug', 'text', 'img', 'icon', 'meta_title', 'meta_desc'];
    $data = getCachedData('cached_category', function () use ($selectColumns) {
        return Category::where('active', 1)
            ->select($selectColumns)
            ->orderBy('order', 'asc')
            ->get();
    });
    $filteredData = removeEmptyValues($data);
    return $filteredData;
});

Route::get('api/catalog/{category_slug}', function ($category_slug) {
    $category = Category::where('slug', $category_slug)->first();

    if (!$category) {
        return response()->json(['message' => 'Category not found'], 404);
    }

    $selectColumns = ['title', 'slug', 'hit', 'text', 'mini_text', 'category_slug', 'article', 'img', 'icon', 'url', 'price_min', 'price_max', 'composition', 'applications', 'storage', 'restriction', 'volum',  'weight_no_box', 'weight_box','height_box','width_box','best_before_date','action','purpose','meta_title','meta_desc',];

    $data = getCachedData('category_data' . $category_slug, function () use ($selectColumns, $category) {
        return Item::where('active', 1)
            ->select($selectColumns)
            ->where('category_slug', $category->slug)
            ->get();
    });
    $filteredData = removeEmptyValues($data);
    return $filteredData;
});
 
Route::get('api/catalog/{category_slug}/{item_slug}', function ($category_slug, $item_slug) {
    $category = Category::where('slug', $category_slug)->first();
    if (!$category) {
        return response()->json(['message' => 'Category not found'], 404);
    }
    $selectColumns = ['title', 'slug', 'hit', 'text', 'mini_text', 'slider','category_slug', 'article', 'img', 'icon', 'url', 'price_min', 'price_max', 'composition', 'applications', 'storage', 'restriction', 'volum',  'weight_no_box', 'weight_box','height_box','width_box','best_before_date','action','purpose','meta_title','meta_desc',];
    $data = getCachedData('item_' . $item_slug, function () use ($selectColumns, $category, $item_slug) {
        return Item::where('active', 1)
            ->select($selectColumns)
            ->where('category_slug', $category->slug)
            ->where('slug', $item_slug)
            ->first();
    });
    $filteredData = array_filter($data->toArray(), function ($value) {
        return $value !== null && $value !== '';
    });
    if (empty($filteredData)) {
        return response()->json(['message' => 'Item not found'], 404);
    }
    return $filteredData;
    // if (!$data->attributes) {
    //     return response()->json(['message' => 'Item not found'], 404);
    // }
    //     return $data;
 
});

Route::get('api/hit', function () {
    $selectColumns = ['title', 'slug', 'hit', 'text', 'mini_text',  'category_slug', 'article', 'img', 'icon', 'url', 'price_min', 'price_max', 'composition', 'applications', 'storage', 'restriction', 'volum',  'weight_no_box', 'weight_box','height_box','width_box','best_before_date','action','purpose','meta_title','meta_desc',];

    $data = getCachedData('hit_products', function () use ($selectColumns) {
        return Item::where('active', 1)
            ->where('hit', true)
            ->select($selectColumns)
            ->get();
    });

    $filteredData = array_map(function ($item) {
        return array_filter((array) $item, function ($value) {
            return !empty($value);
        });
    }, $data->toArray());

    return $filteredData;
});


// Route::post('api/test', function (Request $request) {
 
//    $requestData = $request->input();
//  return response()->json(['name' => '123']);
//     // Log::info('Request data:', ['request' =>  $requestData['name']  ]);
 
// });

Route::post('api/callback', function (Request $request) {
    $data = json_decode($request->getContent());

//   Log::info('Request data:', ['request' => $data->name ]);

            Callback::create([
                 'ip' => $request->header('X-Real-IP') ?? $request->ip(),
                 'name' => $data->name ,
                 'phone' => $data->phone,
                 'email' => $data->email,  
                 'text' => $data->text,  
                 'page' => $data->page,  
            ]);
 
    return response()->json(['message' => $request->all()], 201);
});

Route::post('order', 'Mdeko\Api\Controllers\Order@handleNotification');

?>