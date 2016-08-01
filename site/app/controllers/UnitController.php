<?php

/**
 * User: jzx
 * Date: 2016/7/29
 * Time: 11:08
 */

use common\services\UnitService;
use common\utils\Result;
use common\utils\Json;

class UnitController extends ControllerBase
{
    public function createAction()
    {
        $data = $this->transform($_POST);
        $item = UnitService::singleton()->create($data);
        return Result::success($item);
    }

    public function updateAction($id)
    {
        $data = $this->transform($_POST);
        UnitService::singleton()->update($id, $data);
        return Result::success();
    }

    public function deleteAction($id)
    {
        UnitService::singleton()->delete($id);
        return Result::success();
    }

    public function getAction($id)
    {
        $item = UnitService::singleton()->get($id);
        $item = UnitService::singleton()->transform($item);
        return Result::success($item);
    }

    private function transform($data)
    {
        $data['request_parameter'] = Json::encode($data['request_parameter']);
        $data['success_parameter'] = Json::encode($data['success_parameter']);
        return $data;
    }
}