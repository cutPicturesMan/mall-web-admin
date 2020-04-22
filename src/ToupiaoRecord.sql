-- 菜单对应按钮SQL

insert into `sys_permission` ( `name`, `pid`, `status`, `sort`, `value`, `type`, `create_time`, `uri`, `icon`) values
( '投票记录列表', '47', '1', '0', 'toupiao:toupiaoRecord:read', '1', '2018-09-29 16:18:51', 'toupiaoRecord', null);
insert into `sys_permission` ( `name`, `pid`, `status`, `sort`, `value`, `type`, `create_time`, `uri`, `icon`) values
( '添加投票记录', '47', '1', '0', 'toupiao:toupiaoRecord:create', '2', '2018-09-29 16:18:51', 'addToupiaoRecord', null);
insert into `sys_permission` ( `name`, `pid`, `status`, `sort`, `value`, `type`, `create_time`, `uri`, `icon`) values
( '修改投票记录', '47', '1', '0', 'toupiao:toupiaoRecord:update', '2', '2018-09-29 16:18:51', 'updateToupiaoRecord', null);
insert into `sys_permission` ( `name`, `pid`, `status`, `sort`, `value`, `type`, `create_time`, `uri`, `icon`) values
( '删除投票记录', '47', '1', '0', 'toupiao:toupiaoRecord:delete', '2', '2018-09-29 16:18:51', 'deleteToupiaoRecord', null);


{
path: 'toupiaoRecord',
name: 'toupiaoRecord',
component: () => import('@/views/toupiao/toupiaoRecord/index'),
meta: {title: '投票记录列表', icon: 'product-list'}
},

{
path: 'addToupiaoRecord',
name: 'addToupiaoRecord',
component: () => import('@/views/toupiao/toupiaoRecord/add'),
meta: {title: '添加投票记录'},
hidden: true
},
{
path: 'updateToupiaoRecord',
name: 'updateToupiaoRecord',
component: () => import('@/views/toupiao/toupiaoRecord/update'),
meta: {title: '编辑投票记录'},
hidden: true
},
