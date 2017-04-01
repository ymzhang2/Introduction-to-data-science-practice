yi.shi02@ele.me


drop table temp.zhuoyu_cancel_tag_tms_pickup_0327001;
create table temp.zhuoyu_cancel_tag_tms_pickup_0327001 as
select 
b.order_date,

case when b.tms_type=7 then '自营'
     when b.tms_type=5 then '团队'
     when b.tms_type=10 then '生活半径'
     when b.tms_type=6 then '众包'
     when b.tms_type=9 then '点我达' end as tms_type,

case when b.product_tag='SIG' then '专送'
when b.product_tag='KS' then '快送'
when b.product_tag='XT' then '选推'
else '其他' end as product_tag,

case when time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 <= 5 then '0-5min'
when time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 > 5 and time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 <= 10 then '5-10min'
when time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 > 10 and time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 <= 20 then '10-20min'
when time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 > 20 then '>20min' end as pickup,

count(distinct b.tracking_id) as tds,--推单数

count(distinct b.tracking_id)-count(distinct case when (b.shipping_state=60 and b.shipping_reason_code=9) or (b.shipping_state=90 and b.order_remark_code='REJECT_ORDER') then b.tracking_id end) as jdds,--接单数

count(distinct case when b.shipping_state=40 and b.is_valid<>1 then b.tracking_id end) as qzd,--欺诈单数

count(distinct case when (b.shipping_state=70 or b.shipping_state=90) and b.order_remark_code in ('MERCHANT_INTERRUPT_DELIVERY_ERROR','MERCHANT_FOOD_ERROR','MERCHANT_CALL_LATE_ERROR','USER_NOT_ANSWER_ERROR','USER_RETURN_ORDER_ERROR','USER_ADDRESS_ERROR','DELIVERY_OUT_OF_SERVICE','SYSTEM_MARKED_ERROR','CARRIER_REMARK_EXCEPTION_ERROR','OTHER_ERROR') then b.tracking_id end) as ycd,--异常单

count(distinct case when (b.shipping_state=60 and b.shipping_reason_code=1) or (b.shipping_state=90 and b.order_remark_code='MERCHANT_CANCEL') then b.tracking_id end) as sjqxd,--商户取消单数

count(distinct case when (b.shipping_state=60 and  b.shipping_reason_code=3) or (b.shipping_state=90 and b.order_remark_code='USER_CANCEL') then b.tracking_id end) as usr_qxd,--用户取消单数

count(distinct case when (b.shipping_state=60 and  b.shipping_reason_code=2) or (b.shipping_state=90 and b.order_remark_code='CARRIER_CANCEL') then b.tracking_id end) as peisong_qxd--配送取消单数

from
(select * from dm.dm_tms_apollo_waybill_wide_detail where dt=get_date(-1) and order_date=get_date(-1) 
and tms_source_id=1 and is_fml=0 and tms_type in (0,5,6,7,9,10)) b 


group by
b.order_date,
case when b.tms_type=7 then '自营'
     when b.tms_type=5 then '团队'
     when b.tms_type=10 then '生活半径'
     when b.tms_type=6 then '众包'
     when b.tms_type=9 then '点我达' end,

case when b.product_tag='SIG' then '专送'
when b.product_tag='KS' then '快送'
when b.product_tag='XT' then '选推'
else '其他' end,

case when time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 <= 5 then '0-5min'
when time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 > 5 and time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 <= 10 then '5-10min'
when time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 > 10 and time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 <= 20 then '10-20min'
when time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 > 20 then '>20min' end;




drop table temp.zhuoyu_cancel_tag_tms_pickup_0327002;
create table temp.zhuoyu_cancel_tag_tms_pickup_0327002 as
select 
b.order_date,

'大物流' as tms_type,
'大物流' as product_tag,

case when time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 <= 5 then '0-5min'
when time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 > 5 and time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 <= 10 then '5-10min'
when time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 > 10 and time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 <= 20 then '10-20min'
when time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 > 20 then '>20min' end as pickup,

count(distinct b.tracking_id) as tds,--推单数

count(distinct b.tracking_id)-count(distinct case when (b.shipping_state=60 and b.shipping_reason_code=9) or (b.shipping_state=90 and b.order_remark_code='REJECT_ORDER') then b.tracking_id end) as jdds,--接单数

count(distinct case when b.shipping_state=40 and b.is_valid<>1 then b.tracking_id end) as qzd,--欺诈单数

count(distinct case when (b.shipping_state=70 or b.shipping_state=90) and b.order_remark_code in ('MERCHANT_INTERRUPT_DELIVERY_ERROR','MERCHANT_FOOD_ERROR','MERCHANT_CALL_LATE_ERROR','USER_NOT_ANSWER_ERROR','USER_RETURN_ORDER_ERROR','USER_ADDRESS_ERROR','DELIVERY_OUT_OF_SERVICE','SYSTEM_MARKED_ERROR','CARRIER_REMARK_EXCEPTION_ERROR','OTHER_ERROR') then b.tracking_id end) as ycd,--异常单

count(distinct case when (b.shipping_state=60 and b.shipping_reason_code=1) or (b.shipping_state=90 and b.order_remark_code='MERCHANT_CANCEL') then b.tracking_id end) as sjqxd,--商户取消单数

count(distinct case when (b.shipping_state=60 and  b.shipping_reason_code=3) or (b.shipping_state=90 and b.order_remark_code='USER_CANCEL') then b.tracking_id end) as usr_qxd,--用户取消单数

count(distinct case when (b.shipping_state=60 and  b.shipping_reason_code=2) or (b.shipping_state=90 and b.order_remark_code='CARRIER_CANCEL') then b.tracking_id end) as peisong_qxd--配送取消单数

from
(select * from dm.dm_tms_apollo_waybill_wide_detail where dt=get_date(-1) and order_date=get_date(-1) 
and tms_source_id=1 and is_fml=0 and tms_type in (0,5,6,7,9,10)) b 

group by
b.order_date,
case when time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 <= 5 then '0-5min'
when time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 > 5 and time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 <= 10 then '5-10min'
when time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 > 10 and time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 <= 20 then '10-20min'
when time_diff(b.taker_arrive_rst_at, b.pickup_at)/60 > 20 then '>20min' end;






drop table temp.zhuoyu_cancel_tag_tms_pickup_0327003;
create table temp.zhuoyu_cancel_tag_tms_pickup_0327003 as
select 
b.order_date,

'大物流' as tms_type,
'大物流' as product_tag,
'大物流' as pickup,

count(distinct b.tracking_id) as tds,--推单数

count(distinct b.tracking_id)-count(distinct case when (b.shipping_state=60 and b.shipping_reason_code=9) or (b.shipping_state=90 and b.order_remark_code='REJECT_ORDER') then b.tracking_id end) as jdds,--接单数

count(distinct case when b.shipping_state=40 and b.is_valid<>1 then b.tracking_id end) as qzd,--欺诈单数

count(distinct case when (b.shipping_state=70 or b.shipping_state=90) and b.order_remark_code in ('MERCHANT_INTERRUPT_DELIVERY_ERROR','MERCHANT_FOOD_ERROR','MERCHANT_CALL_LATE_ERROR','USER_NOT_ANSWER_ERROR','USER_RETURN_ORDER_ERROR','USER_ADDRESS_ERROR','DELIVERY_OUT_OF_SERVICE','SYSTEM_MARKED_ERROR','CARRIER_REMARK_EXCEPTION_ERROR','OTHER_ERROR') then b.tracking_id end) as ycd,--异常单

count(distinct case when (b.shipping_state=60 and b.shipping_reason_code=1) or (b.shipping_state=90 and b.order_remark_code='MERCHANT_CANCEL') then b.tracking_id end) as sjqxd,--商户取消单数

count(distinct case when (b.shipping_state=60 and  b.shipping_reason_code=3) or (b.shipping_state=90 and b.order_remark_code='USER_CANCEL') then b.tracking_id end) as usr_qxd,--用户取消单数

count(distinct case when (b.shipping_state=60 and  b.shipping_reason_code=2) or (b.shipping_state=90 and b.order_remark_code='CARRIER_CANCEL') then b.tracking_id end) as peisong_qxd--配送取消单数

from
(select * from dm.dm_tms_apollo_waybill_wide_detail where dt=get_date(-1) and order_date=get_date(-1) 
and tms_source_id=1 and is_fml=0 and tms_type in (0,5,6,7,9,10)) b 

group by
b.order_date;



drop table temp.zhuoyu_cancel_tag_tms_pickup_0327004;
create table temp.zhuoyu_cancel_tag_tms_pickup_0327004 as 
select 
a.order_date,
a.tms_type,
a.product_tag,
a.pickup,
a.tds,
a.tds/b.tds as tds_rate,
a.jdds,
a.qzd,
a.sjqxd,
a.usr_qxd,
a.peisong_qxd,
a.sjqxd+a.usr_qxd+a.peisong_qxd as ycqxd,
(a.sjqxd+a.usr_qxd+a.peisong_qxd)/(a.tds-a.qzd) as ycqxd_rate,
a.sjqxd/(a.tds-a.qzd) as sjqxd_rate,
a.usr_qxd/(a.tds-a.qzd) as usr_qxd_rate,
a.peisong_qxd/(a.tds-a.qzd) as peisong_qxd_rate 
from 
(select * from temp.zhuoyu_cancel_tag_tms_pickup_0327001) a
left join
(select * from temp.zhuoyu_cancel_tag_tms_pickup_0327002)  b
on a.pickup=b.pickup
;



drop table temp.zhuoyu_cancel_tag_tms_pickup_0327005;
create table temp.zhuoyu_cancel_tag_tms_pickup_0327005 as 
select 
a.order_date,
a.tms_type,
a.product_tag,
a.pickup,
a.tds,
a.tds/b.tds as tds_rate,
a.jdds,
a.qzd,
a.sjqxd,
a.usr_qxd,
a.peisong_qxd,
a.sjqxd+a.usr_qxd+a.peisong_qxd as ycqxd,
(a.sjqxd+a.usr_qxd+a.peisong_qxd)/(a.tds-a.qzd) as ycqxd_rate,
a.sjqxd/(a.tds-a.qzd) as sjqxd_rate,
a.usr_qxd/(a.tds-a.qzd) as usr_qxd_rate,
a.peisong_qxd/(a.tds-a.qzd) as peisong_qxd_rate 
from 
(select * from temp.zhuoyu_cancel_tag_tms_pickup_0327002) a
left join
(select * from temp.zhuoyu_cancel_tag_tms_pickup_0327003)  b
on a.order_date=b.order_date
;





drop table temp.zhuoyu_cancel_tag_tms_pickup_0327006;
create table temp.zhuoyu_cancel_tag_tms_pickup_0327006 as 
select 
order_date,
tms_type,
product_tag,
pickup,
tds,
'1' as tds_rate,
jdds,
qzd,
sjqxd,
usr_qxd,
peisong_qxd,
sjqxd+usr_qxd+peisong_qxd as ycqxd,
(sjqxd+usr_qxd+peisong_qxd)/(tds-qzd) as ycqxd_rate,
sjqxd/(tds-qzd) as sjqxd_rate,
usr_qxd/(tds-qzd) as usr_qxd_rate,
peisong_qxd/(tds-qzd) as peisong_qxd_rate 
from temp.zhuoyu_cancel_tag_tms_pickup_0327003;




drop table temp.zhuoyu_cancel_tag_tms_pickup_0327007;
create table temp.zhuoyu_cancel_tag_tms_pickup_0327007 as
select * from temp.zhuoyu_cancel_tag_tms_pickup_0327004
union all
select * from temp.zhuoyu_cancel_tag_tms_pickup_0327005
union all
select * from temp.zhuoyu_cancel_tag_tms_pickup_0327006;





select 
order_date   as`日期`,
tms_type   as`运力线`,
product_tag as `标品`,
pickup as `骑手取餐时间－骑手到店时间`,
tds  as`推单数`,
tds_rate as `推单数占比`,
jdds as`接单数`,
qzd  as`欺诈单`,
ycqxd  as`异常取消单`,
sjqxd as`商家取消单`,
peisong_qxd  as`配送取消单`,
usr_qxd      as`用户取消单`,
ycqxd_rate   as`异常取消率`,
sjqxd_rate   as`商户取消率`,
usr_qxd_rate as`用户取消率`,
peisong_qxd_rate   as`配送方异常取消率` 
from temp.zhuoyu_cancel_tag_tms_pickup_0327007
where tms_type is not null;









