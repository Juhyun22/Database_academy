# 1. Inner Join 
select store.`name`, store.phoneNumber, nr.menu, nr.userName, nr.`point`, nr.review
from `store`
inner join `new_review` As nr
on store.id = nr.storeId;

# 2. Letf Join 
select store.`name`, store.phoneNumber, nr.menu, nr.userName, nr.`point`, nr.review
from `store`
left join `new_review` As nr
on store.id = nr.storeId;

