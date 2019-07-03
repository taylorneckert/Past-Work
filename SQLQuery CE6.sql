--1
select o.order_num, o.order_date, o.customer_num, c.customer_name
from orders O Inner join customer c on o.customer_num = c.customer_num

--2
select order_num, orders.customer_num, customer_name
from orders, customer
where orders.customer_num = customer.customer_num
and order_date = '10-15-2015'



--3
select o.order_num, o.order_date, L.item_num, L.num_ordered, L.quoted_price
from orders o inner join order_line L on O.order_num = L.order_num

--4
select customer_num, customer_name
from customer
where customer_num in (select customer_num
						from orders
						where order_date = '15-OCT-2015'
						)

--4 using a join
select distinct c.customer_num, c.customer_name
from customer c inner join orders o on c.customer_num = o.customer_num
where o.order_date = '15-oct-2015'

--5
--What is the Min balance
select min(balance)
from customer

--List the number and name of customers whose balance is the lowest
select customer_num, customer_name
from customer
where balance = min(balance)
-- in this case, it takes the min balance of each row, but the min balance is not defined in each row- a common error

--correct way
select customer_num, customer_name
from customer
where balance = (select min(balance) from customer)

--6
select orders.customer_num, customer_name
from orders, customer
where orders.customer_num = customer.customer_num
and order_date <> '10-15-2015'

--7
select o.order_num, o.order_date, i.item_num, i.description, i.category
from orders o inner join order_line L on o.order_num = L.order_num 
	inner join item i on l.item_num = i.item_num
order by item_num


--8
select i.category, o.order_num, o.order_date, i.item_num, i.description
from orders o inner join order_line L on o.order_num = L.order_num 
	inner join item i on l.item_num = i.item_num
order by category, order_num


--9
-- if you run the nested query only, 30 is listed twice because _______. but the entire query 
--only lists the rep number only once since 
--the rep number is only listed in the rep table only once
select rep_num, last_name, first_name
from rep
where rep_num in (select rep_num
				  from customer
				  where credit_limit = 10000
				  )	


--10
select rep.rep_num, last_name, first_name
from rep, customer
where customer.rep_num = rep.rep_num
				  AND credit_limit= '10000'

--11
select customer_num, customer_name
from customer
where customer_num in 
	   (select customer_num
	   from orders
	   where order_num in 
	   (select order_num
	   from order_line
	   where item_num in 
	   (select item_num
	   from item
	   where description = 'rocking horse'
	   )))

--the following query produces the same result as the one above. You would not always be that way because the in statement is looking
--to see if a specific item is in that group
-- when you do joins [for one to many relationships], you expand. see notes for image 
select c.customer_num, c.customer_name
from customer c inner join orders o on c.customer_num = o.customer_num
	 inner join order_line L on o.order_num = L.order_num
	 inner join item i on l.item_num = i.item_num
where i.description = 'rocking horse'	 	


--12
select a.item_num, a.description, b.category
from item A, item B
where a.category = b.category
and a.item_num > b.item_num

--13 
Select order_num, order_date
from   orders
where  customer_num in 
	   (select customer_num
	   from customer
	   where customer_name = 'johnson''s deopartment store'
	   )

--14
select orders.order_num, orders.order_date
from item, order_line, orders
where orders.order_num = order_line.order_num
				AND
				item.item_num = order_line.item_num


--15
select order_num, order_date, customer_num
from orders
where customer_num in 
      (select customer_num
	  from customer
	  where customer_name = 'almondton general store'
	  )
	  OR
	  order_num in 
	  (select order_num
	  from order_line L inner join item i on l.item_num = i.item_num
	  where i.description = 'fire engine'
	  )


--16
select orders.order_num, orders.order_date
from item, order_line, orders, customer
where order_line.order_num = orders.order_num
		AND item.item_num = order_line.item_num
		AND customer.customer_name = 'Almondton General Store'
		AND item.DESCRIPTION = 'Fire Engine'

--17 cannot use "in" and <> because same order may contain multiple lines, one of which may be fire engine
select order_num, order_date, customer_num
from orders
where customer_num in 
      (select customer_num
	  from customer
	  where customer_name = 'almondton general store'
	  )
	  and
	  order_num not in 
	  (select order_num
	  from order_line L inner join item i on l.item_num = i.item_num
	  where i.description = 'fire engine'
	  )

--18
select item_num, description, price, category
from item
where price > ALL
		(Select price from item where category = 'GME')


--19
select *
from item
where item_num not in (select item_num from order_line)

--Answer to the question
select i.item_num, i.description,i.on_hand, l.item_num, l.order_num, l.num_ordered
from item i left outer join order_line l on i.item_num = l.item_num

--Same result
select i.item_num, i.description, i.on_hand, l.item_num, l.order_num, l.num_ordered
from order_line l right outer join item i on i.item_num = l.item_num


--20
select item_num, description, price, category
from item
where price > ANY
		(Select price from item where category = 'GME')
-- Instead, the query returns all items that have a price larger than any of the GME price

--21
select *
from customer
where rep_num is null

insert into customer values(999, 'keystone', 'cardinal', 'louisville', 'ky', '40292', 100, 1000, null)

select *
from customer
where rep_num is null

select *
from rep
where rep_num not in (select distinct rep_num from customer where rep_num is not null)


--find customers without a rep using an outer join
select c.customer_name, c.rep_num, r.rep_num
from customer c left outer join rep r on c.rep_num = r.rep_num
where r.rep_num is null


-- find customers whose balance is higher than the balances of all the customers from fullton
select *
from customer
where balance > (select max(balance) from customer)
--^^ doesnt work because asking to find a balance that is greater than the max of the dataset, doesn't make sense
select *
from customer
where balance > (select max(balance) from customer where city = 'fullton')

-- all is equvalent to using max, while any is equivalent to using min
select *
from customer
where balance > all (select balance from customer where city = 'fullton')