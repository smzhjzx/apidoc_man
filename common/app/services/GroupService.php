<?php
/**
 * User: jzx
 * Date: 2016/7/28
 * Time: 10:58
 */

namespace common\services;

class GroupService extends ServiceBase
{
    public function find($params)
    {
        $condition = '1=1';
        $bind = [];
        if (!empty($params['project_id'])) {
            $condition .= " and project_id = {$params['project_id']}";
            $bind['project_id'] = $params['project_id'];
        }
        return \Group::find([
            $condition,
            'bind' => $bind
        ]);
    }

    public function create($data)
    {
        $item = new \Group();
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
        return \Group::findFirst($id);
    }

    public function delete($id)
    {
        $this->get($id)->delete();
    }
}