<?php

/**
 * User: jzx
 * Date: 2016/7/28
 * Time: 9:18
 */

use common\services\ProjectService;
use common\services\GroupService;
use common\services\UnitService;

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
        foreach ($groups as $group) {
            $group->units = UnitService::getInstance()->find(['group_id' => $group->id]);
        }

        $this->view->project = $project;
        $this->view->groups = $groups;
    }
}