<?php

/**
 * User: jzx
 * Date: 2016/7/29
 * Time: 11:08
 */

use common\services\UnitService;
use common\utils\Result;

class UnitController extends ControllerBase
{
    public function createAction()
    {
        $data = $this->transferData($_POST);
        $item = UnitService::getInstance()->create($data);
        return Result::success($item);
    }

    public function updateAction($id)
    {
        $data = $this->transferData($_POST);
        UnitService::getInstance()->update($id, $data);
        return Result::success();
    }

    public function deleteAction($id)
    {
        UnitService::getInstance()->delete($id);
        return Result::success();
    }

    public function getAction($id)
    {
        $item = UnitService::getInstance()->get($id);
        $item = UnitService::getInstance()->transferData($item);
        return Result::success($item);
    }

    private function transferData($data)
    {
        $data['request_parameter'] = json_encode($data['request_parameter']);
        return $data;
    }
}