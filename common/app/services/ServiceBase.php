<?php

/**
 * User: jzx
 * Date: 2016/7/28
 * Time: 10:47
 */

namespace common\services;

class ServiceBase
{
    protected static $instances = [];

    private function __construct()
    {
    }

    public function __clone()
    {
    }

    public static function getInstance()
    {
        $clsName = get_called_class();
        if (!isset(static::$instances[$clsName])) {
            static::$instances[$clsName] = new static;
        }
        return static::$instances[$clsName];
    }

}