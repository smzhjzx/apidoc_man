<?php
/**
 * User: jzx
 * Date: 2016/7/29
 * Time: 9:27
 */

namespace common\utils;


class Result
{
    private static $defaultResponseData = [
        'success' => true,
        'msg' => '',
        'data' => null,
        'total' => null
    ];

    public static function success($data = [], $total = null)
    {
        $result = array_merge(self::$defaultResponseData, ['data' => $data, 'total' => $total]);
        return json_encode($result);
    }
}