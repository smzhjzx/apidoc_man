<?php
/**
 * User: jzx
 * Date: 2016/8/1
 * Time: 9:34
 */

namespace common\utils;


class Json
{
    public static function decode($string)
    {
        if (empty($string)) {
            return [];
        }
        return json_decode($string);
    }

    public static function encode($value)
    {
        if (empty($value)) {
            return '';
        }
        return json_encode($value);
    }
}