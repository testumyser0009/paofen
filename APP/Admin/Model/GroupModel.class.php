<?php
// +----------------------------------------------------------------------
// | 零云 [ 简单 高效 卓越 ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.lingyun.net All rights reserved.
// +----------------------------------------------------------------------
// | Author: jry <bbs.sasadown.cn>
// +----------------------------------------------------------------------
namespace Admin\Model;

use Common\Model\ModelModel;

/**
 * 部门模型
 * @author jry <bbs.sasadown.cn>
 */
class GroupModel extends ModelModel
{
    /**
     * 数据库表名
     * @author jry <bbs.sasadown.cn>
     */
    protected $tableName = 'group';

    /**
     * 自动验证规则
     * @author jry <bbs.sasadown.cn>
     */
    protected $_validate = array(
        array('title', 'require', '角色名不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('title', '1,32', '角色名长度为1-32个字符', self::EXISTS_VALIDATE, 'length', self::MODEL_BOTH),
        array('title', '', '角色名已经存在', self::VALUE_VALIDATE, 'unique', self::MODEL_BOTH),
        array('menu_auth', 'require', '权限不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
    );

    /**
     * 自动完成规则
     * @author jry <bbs.sasadown.cn>
     */
    protected $_auto = array(
        array('create_time', 'time', self::MODEL_INSERT, 'function'),
        array('update_time', 'time', self::MODEL_BOTH, 'function'),
        array('status', '1', self::MODEL_INSERT),
    );

    /**
     * 检查部门功能权限
     * @author jry <bbs.sasadown.cn>
     */
    public function checkMenuAuth()
    {
        $current_col = CONTROLLER_NAME; // 当前菜单
        $user_col   = D('Admin/Menu')->getCol(); // 获得当前登录用户信息
        if ($user_col !== '1') {
            if(!in_array($current_col,$user_col)){
                return false;
            }
           
            return true;
        } else {
            return true; // 超级管理员无需验证
        }
        return false;
    }
}
