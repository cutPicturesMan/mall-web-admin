import request from '@/utils/request'
export function fetchList(params) {
    return request({
        url:'/sys/SysSchool/list',
        method:'get',
        params:params
    })
}
export function createSchool(data) {
    return request({
        url:'/sys/SysSchool/create',
        method:'post',
        data:data
    })
}

export function deleteSchool(id) {
    return request({
        url:'/sys/SysSchool/delete/'+id,
        method:'get',
    })
}

export function getSchool(id) {
    return request({
        url:'/sys/SysSchool/'+id,
        method:'get',
    })
}

export function updateSchool(id,data) {
    return request({
        url:'/sys/SysSchool/update/'+id,
        method:'post',
        data:data
    })
}

