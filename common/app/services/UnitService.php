<?php
/**
 * User: jzx
 * Date: 2016/7/28
 * Time: 10:59
 */

namespace common\services;


class UnitService extends ServiceBase
{
    public function find($params)
    {
        $condition = '1=1';
        $bind = [];
        if (!empty($params['group_id'])) {
            $condition .= " and group_id = {$params['group_id']}";
            $bind['group_id'] = $params['group_id'];
        }
        return \Unit::find([
            $condition,
            'bind' => $bind
        ]);
    }

    public function create($data)
    {
        $item = new \Unit();
        $item->create($data);
        return $item;
    }

    public function update($id, $data)
    {
        $item = \Unit::findFirst($id);
        $item->update($data);
    }
}