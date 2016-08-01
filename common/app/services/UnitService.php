<?php
/**
 * User: jzx
 * Date: 2016/7/28
 * Time: 10:59
 */

namespace common\services;


use common\utils\Json;

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
        $result = \Unit::find([
            $condition,
            'bind' => $bind
        ]);
        $all = [];
        foreach ($result as $item) {
            $all[] = $this->transform($item);
        }
        return (Object)$all;
    }

    public function create($data)
    {
        $item = new \Unit();
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
        return \Unit::findFirst($id);
    }

    public function delete($id)
    {
        $this->get($id)->delete();
    }

    public function transform(\Unit $item)
    {
        $item = $item->toArray();
        foreach ($item as $key => $value) {
            if (empty($value)) {
                $item[$key] = '';
            }
        }
        $item['request_parameter'] = Json::decode($item['request_parameter']);
        $item['success_parameter'] = Json::decode($item['success_parameter']);
        return (Object)$item;
    }
}