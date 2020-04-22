-- 菜单对应按钮SQL

insert into `sys_permission` ( `name`, `pid`, `status`, `sort`, `value`, `type`, `create_time`, `uri`, `icon`) values
( '投票项目列表', '47', '1', '0', 'toupiao:toupiaoProject:read', '1', '2018-09-29 16:18:51', 'toupiaoProject', null);
insert into `sys_permission` ( `name`, `pid`, `status`, `sort`, `value`, `type`, `create_time`, `uri`, `icon`) values
( '添加投票项目', '47', '1', '0', 'toupiao:toupiaoProject:create', '2', '2018-09-29 16:18:51', 'addToupiaoProject', null);
insert into `sys_permission` ( `name`, `pid`, `status`, `sort`, `value`, `type`, `create_time`, `uri`, `icon`) values
( '修改投票项目', '47', '1', '0', 'toupiao:toupiaoProject:update', '2', '2018-09-29 16:18:51', 'updateToupiaoProject', null);
insert into `sys_permission` ( `name`, `pid`, `status`, `sort`, `value`, `type`, `create_time`, `uri`, `icon`) values
( '删除投票项目', '47', '1', '0', 'toupiao:toupiaoProject:delete', '2', '2018-09-29 16:18:51', 'deleteToupiaoProject', null);


{
path: 'toupiaoProject',
name: 'toupiaoProject',
component: () => import('@/views/toupiao/toupiaoProject/index'),
meta: {title: '投票项目列表', icon: 'product-list'}
},

{
path: 'addToupiaoProject',
name: 'addToupiaoProject',
component: () => import('@/views/toupiao/toupiaoProject/add'),
meta: {title: '添加投票项目'},
hidden: true
},
{
path: 'updateToupiaoProject',
name: 'updateToupiaoProject',
component: () => import('@/views/toupiao/toupiaoProject/update'),
meta: {title: '编辑投票项目'},
hidden: true
},
