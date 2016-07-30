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
        $data = $_POST;
        $data['request_parameter'] = json_encode($data['request_parameter']);
        $item = UnitService::getInstance()->create($data);
        return Result::success($item);
    }

    public function updateAction($id)
    {
        $data = $_POST;
        UnitService::getInstance()->update($id, $data);
        return Result::success();
    }

    public function deleteAction($id)
    {
        UnitService::getInstance()->delete($id);
        return Result::success();
    }
}