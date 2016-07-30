<?php

/**
 * User: jzx
 * Date: 2016/7/29
 * Time: 11:08
 */

use common\services\GroupService;
use common\utils\Result;

class GroupController extends ControllerBase
{
    public function createAction()
    {
        $data = $_POST;
        $item = GroupService::getInstance()->create($data);
        return Result::success($item);
    }

    public function updateAction($id)
    {
        $data = $_POST;
        GroupService::getInstance()->update($id, $data);
        return Result::success();
    }

    public function deleteAction($id)
    {
        GroupService::getInstance()->delete($id);
        return Result::success();
    }
}