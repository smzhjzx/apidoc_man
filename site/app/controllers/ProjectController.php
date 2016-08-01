<?php

/**
 * User: jzx
 * Date: 2016/7/28
 * Time: 9:18
 */

use common\services\ProjectService;
use common\services\GroupService;
use common\services\UnitService;
use common\utils\Result;

class ProjectController extends ControllerBase
{
    public function listAction()
    {
        $result = ProjectService::singleton()->find();
        $this->view->projects = $result;
    }

    public function detailAction($id)
    {
        $project = ProjectService::singleton()->get($id);
        $groups = GroupService::singleton()->find(['project_id' => $id]);

        $all = [];
        foreach ($groups as $group) {
            $group->units = UnitService::singleton()->find(['group_id' => $group->id]);
            $all[] = $group;
        }

        $this->view->project = $project;
        $this->view->groups = $all;
        $this->view->emptyUnit = UnitService::singleton()->transform(new Unit());
    }

    public function createAction()
    {
        $data = $_POST;
        $item = ProjectService::singleton()->create($data);
        return Result::success($item);
    }

    public function updateAction($id)
    {
        $data = $_POST;
        ProjectService::singleton()->update($id, $data);
        return Result::success();
    }

    public function deleteAction($id)
    {
        ProjectService::singleton()->delete($id);
        return Result::success();
    }
}