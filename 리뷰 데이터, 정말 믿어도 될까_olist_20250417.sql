--- 1 `order_id` '03c939fd7fd3b38f8485a0f95798f1f6'가 동일한 `order_id`로 리뷰를 3개 남겨져 있다. 
select *
from order_reviews
where `order_id` = '03c939fd7fd3b38f8485a0f95798f1f6'
order by `order_id`
;

--- 2 `order_id` '03c939fd7fd3b38f8485a0f95798f1f6'는 구매한 상품이 1개로 표시 된다. 
select *
from order_items
where `order_id` = '03c939fd7fd3b38f8485a0f95798f1f6'
;

--- 3 `order_id` = '03c939fd7fd3b38f8485a0f95798f1f6'에 연결 된 `customer_id` '2a35ad9f439dfc62d35a0202e71d6c66' 확인 
select *
from orders
where `order_id` = '03c939fd7fd3b38f8485a0f95798f1f6'
;

--- 4 `customer_id` '2a35ad9f439dfc62d35a0202e71d6c66'에 연결 된 커스터머 유니크 아이디 '25f3cf83109f636d52d288fa4e797111' 확인
select *
from customers
where `customer_id` = '2a35ad9f439dfc62d35a0202e71d6c66'
;

--- 5 커스터머 유니크 아이디 '25f3cf83109f636d52d288fa4e797111'에는 3개의  `customer_id`가 연결되어 있다. 
select *
from customers
where `customer_unique_id` = '25f3cf83109f636d52d288fa4e797111'
;
--- 6 커스터머 유니크 아이디 '25f3cf83109f636d52d288fa4e797111'에 연결 된 3개의 `customer_id`를 확인한 결과, 1초 차이지만 거의 같은 시간에 구매한 3개의 `order_id`가 각각 연결 되어 있다.
select *
from orders
where `customer_id` in ('2a35ad9f439dfc62d35a0202e71d6c66', 'a8e9a8abb0f2e70472f4484550eedb73', '7936eb4ddff395a867c29f51b6c25ee1')
;

--- 7 6번에서 확인한 3개의 `order_id`의 상품을 확인한 결과 동일한 상품 'ab5da1daa941470d14366f4e76a99dd2'로 주문내역이 확인 됨
select *
from order_items
where `order_id` in ('03c939fd7fd3b38f8485a0f95798f1f6', '9dc9cfe8dd61f0e37b0baa3043517059', '7791eb26e081ed5f8dd15b40c45393a3')
;
--- 9 `order_id` '7791eb26e081ed5f8dd15b40c45393a3', '9dc9cfe8dd61f0e37b0baa3043517059' 리뷰는 어디에 있나?
select *
from order_reviews
where `order_id` in ('03c939fd7fd3b38f8485a0f95798f1f6', '9dc9cfe8dd61f0e37b0baa3043517059', '7791eb26e081ed5f8dd15b40c45393a3')
order by `order_id` 
;