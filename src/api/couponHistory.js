import request from '@/utils/request'
export function fetchList(params) {
  return request({
    url:'/sms/SmsCouponHistory/list',
    method:'get',
    params:params
  })
}
