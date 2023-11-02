--Ödev
1.
Select product_name, quantity_per_unit from products;
2.
Select product_id,product_name from products
Where Discontinued = 1;
3.
Select product_id,product_name,discontinued from products
Where Discontinued = 1;
4.
Select product_id,product_name,unit_price from products
Where unit_price<20;
5.
Select product_id,product_name,unit_price from products
Where unit_price BETWEEN 15 AND 25;
6.
Select product_name,units_in_stock, units_on_order from products
Where units_in_stock < units_on_order
7.
Select * from products
Where Lower(product_name) LIKE 'a%'
8.
Select * from products
Where product_name LIKE '%i'
9.
SELECT product_name, unit_price, unit_price * 0.18 + unit_price AS unit_price_kdv
FROM products
10.
Select COUNT (unit_price) from products
Where unit_price >30;
11.
Select LOWER(product_name), unit_price from products
ORDER BY unit_price DESC;
12.
Select CONCAT(first_name,' ',last_name) as first_last from employees;
13.
Select company_name,region from suppliers
Where region is NULL;
14.
Select company_name,region from suppliers
Where region is NOT NULL;
15.
Select UPPER(CONCAT('TR',product_name)) from products;
16.
Select product_name, CONCAT('TR',product_name),unit_price from products
Where unit_price <20 
17.
Select product_name, unit_price from products
Where unit_price = (Select MAX(unit_price) from products)
18.
Select product_name,unit_price from products
ORDER BY unit_price DESC limit 10 
19.
Select product_name, unit_price from products
Where unit_price >(Select AVG(unit_price) from products) 
ORDER BY unit_price 
20.
Select  SUM(a.unit_price*a.units_in_stock) as total_price from products AS a
21.
SELECT discontinued AS ProductStatus, COUNT(*) AS ProductCount FROM products
GROUP BY discontinued;
22.
SELECT products.product_name,categories.category_name from products
INNER JOIN categories on products.Category_id = Categories.Category_id;
23.
SELECT category_name,AVG(products.unit_price) AS "Ortalama Fiyat" from categories
INNER JOIN products on categories.category_id = products.category_id
GROUP BY category_name;
24.
Select  c.category_name, p.product_name, unit_price from categories c
INNER JOIN products p 
ON p.category_id = c.category_id
ORDER BY unit_price DESC limit 1
25.
Select p.product_name, c.category_name,s.company_name, p.units_on_order from categories c
INNER JOIN products p 
ON p.category_id = c.category_id
INNER JOIN suppliers s
ON p.supplier_id = s.supplier_id
ORDER BY units_on_order DESC limit 1
26.
SELECT p.supplier_id, p.units_in_stock, p.product_id, p.product_name, s.company_name, s.phone 
FROM products as p
INNER JOIN suppliers as s
ON p.supplier_id = s.supplier_id
WHERE units_in_stock = 0
27.
SELECT o.order_date, o.ship_address, e.first_name, e.last_name FROM orders o
INNER JOIN employees e
ON e.employee_id = o.employee_id
WHERE o.order_date >= '1998-03-01' 
AND o.order_date <= '1998-03-31' 
28.
SELECT COUNT(order_date) FROM orders
WHERE order_date >= '1997-02-01' AND order_date <= '1997-02-28' 
29.
SELECT COUNT(ship_city) 
FROM orders
WHERE order_date >= '01-01-1998' 
AND order_date <= '31-12-1998' AND ship_city 
IN('London')
30.
SELECT c.contact_name, c.phone, o.order_date FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE order_date >= '01-01-1997' AND order_date <= '31-12-1997'
31.
SELECT * FROM orders
WHERE freight > 40
32.
SELECT c.contact_name, o.ship_city, o.freight FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
WHERE freight >= 40
ORDER BY o.freight
33.
SELECT UPPER(CONCAT(e.last_name, ' ' , e.first_name)), o.order_date, o.ship_city 
FROM orders o
INNER JOIN employees e
ON o.employee_id = e.employee_id
WHERE order_date >= '01-01-1997' AND order_date <= '31-12-1997'
34.
SELECT c.contact_name, regexp_replace(c.phone, '[(). -]', '', 'g') 
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
WHERE o.order_date >= '01-01-1997' 
AND order_date <= '31-12-1997'
35.
SELECT o.order_date, c.contact_name, e.first_name, e.last_name FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
INNER JOIN employees e
ON o.employee_id = e.employee_id
36.
select shipped_date,required_date from orders
where shipped_date > required_date
37.
select o.shipped_date,o.required_date,c.contact_name from orders o 
INNER JOIN customers c
on o.customer_id = c.customer_id
where shipped_date > required_date
38.
SELECT od.order_id,p.product_name,c.category_id,p.units_on_order from  order_details od
INNER JOIN products p
on od.product_id =p.product_id
INNER JOIN categories c
on p.category_id = c.category_id
where order_id = 10248
39.
SELECT s.company_name,od.order_id,p.product_name from  order_details od
INNER JOIN products p
on od.product_id =p.product_id
INNER JOIN suppliers s
on p.supplier_id = s.supplier_id
where order_id = 10248
40.

SELECT e.employee_id,e.first_name,e.last_name,p.product_name,od.quantity from  orders o
INNER JOIN employees e
on o.employee_id =e.employee_id
INNER JOIN order_details od
on o.order_id = od.order_id
INNER JOIN products p
on od.product_id =p.product_id
where e.employee_id = 3 and o.order_date >= '1997.01.01' and  o.order_date < '1998.01.01'
41.
Select e.employee_id, e.first_name, e.last_name, od.quantity, o.order_date from orders o
INNER JOIN employees e
ON o.employee_id = e.employee_id
INNER JOIN order_details od
ON od.order_id = o.order_id
INNER JOIN products p
ON od.product_id = p.product_id
WHERE date_part('year',order_date) = 1997
ORDER BY od.quantity DESC limit 1
42.
select e.employee_id,e.first_name,e.last_name,SUM(od.quantity) from order_details od
INNER JOIN orders o
on od.order_id = o.order_id
INNER JOIN employees e
on o.employee_id = e.employee_id
where date_part('year',order_date) = 1997 
group by  e.employee_id
ORDER BY SUM(od.quantity) DESC  LIMIT 1
43.
select p.product_name,p.unit_price,c.category_name from products p 
INNER JOIN categories c
on p.category_id = c.category_id
ORDER BY unit_price DESC  LIMIT 1
44.
select e.first_name,e.last_name,o.order_id,o.order_date from orders o
INNER JOIN employees e
on o.employee_id = e.employee_id
order by order_date 
45.
select AVG(p.unit_price),o.order_date,o.order_id from orders o
INNER JOIN order_details od
on od.order_id =o.order_id
INNER JOIN products p
ON od.product_id = p.product_id
group by o.order_date,o.order_id 
order by o.order_date DESC LIMIT 5  
46.
select SUM(od.quantity),c.category_id,c.category_name,p.product_name from order_details od
INNER JOIN orders o
on od.order_id = o.order_id
INNER JOIN products p
on od.product_id = p.product_id
INNER JOIN categories c
on p.category_id = c.category_id
where date_part('month',order_date) = 1 
group by c.category_id,c.category_name,p.product_name 
47.
Select quantity from order_details
Where quantity > (Select AVG(quantity) from order_details)
ORDER BY quantity 
48.
select p.product_name,c.category_name,s.company_name, od.quantity from order_details od
INNER JOIN orders o
on od.order_id = o.order_id
INNER JOIN products p
on od.product_id = p.product_id
INNER JOIN categories c
on p.category_id = c.category_id
INNER JOIN suppliers s
ON p.supplier_id = s.supplier_id
ORDER BY quantity  DESC limit 1
49.
Select COUNT(DISTINCT country) from customers
50.
Select SUM(od.quantity*p.unit_price) from orders o
INNER JOIN employees e
ON o.employee_id = e.employee_id
INNER JOIN order_details od
ON od.order_id = o.order_id
INNER JOIN products p
ON od.product_id = p.product_id
WHERE e.employee_id =3 AND order_date >= '1998.01.01'















