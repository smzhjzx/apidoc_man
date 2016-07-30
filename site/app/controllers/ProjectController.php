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
        $result = ProjectService::getInstance()->find();
        $this->view->projects = $result;
    }

    public function detailAction($projectId)
    {
        $project = ProjectService::getInstance()->get($projectId);
        $groups = GroupService::getInstance()->find(['project_id' => $projectId]);

        $all = [];
        foreach ($groups as $group) {
            $group->units = UnitService::getInstance()->find(['group_id' => $group->id]);
            $all[] = $group;
        }

        $this->view->project = $project;
        $this->view->groups = $all;
        $this->view->emptyUnit = UnitService::getInstance()->transferData(new Unit());
    }

    public function createAction()
    {
        $data = $_POST;
        $item = ProjectService::getInstance()->create($data);
        return Result::success($item);
    }

    public function updateAction($id)
    {
        $data = $_POST;
        ProjectService::getInstance()->update($id, $data);
        return Result::success();
    }

    public function deleteAction($id)
    {
        ProjectService::getInstance()->delete($id);
        return Result::success();
    }
}