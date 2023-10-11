<?php
// $enableCaching - включает кэщирование
function getCachedData($cacheKey, $queryCallback, $enableCaching = 0) {
    if ($enableCaching) {
        return Cache::remember($cacheKey, 60, $queryCallback);
    } else {
        return $queryCallback();
    }
}
function removeEmptyValues($data) {
    return array_map(function ($item) {
        return array_filter($item, function ($value) {
            return !empty($value);
        });
    }, $data->toArray());
}
 