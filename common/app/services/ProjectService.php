<?php

/**
 * User: jzx
 * Date: 2016/7/28
 * Time: 10:57
 */

namespace common\services;

class ProjectService extends ServiceBase
{
    public function find($params = [])
    {
        $condition = '1=1';
        $bind = [];
        return \Project::find([
            $condition,
            'bind' => $bind
        ]);
    }

    public function create($data)
    {
        $item = new \Project();
        $item->create($data);
        return $item;
    }

    public function update($id, $data)
    {
        $item = $this->get($id);
        $item->update($data);
    }

    public function get($id)
    {
        return \Project::findFirst($id);
    }
}