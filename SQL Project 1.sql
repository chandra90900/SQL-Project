--Perform the following with help of the above database:


--a. Get all the details from the person table including email ID, phone
--number and phone number type
select * from Person.Person
select* from Person.EmailAddress
select * from Person.PersonPhone
select * from Person.PhoneNumberType

select 
per.firstName,per.LastName,email.EmailAddress,
ph.PhoneNumber,phtype.Name 
from
Person.Person as per inner join	Person.EmailAddress as email on per.BusinessEntityID=email.BusinessEntityID
inner join  Person.PersonPhone as ph on per.BusinessEntityID=ph.BusinessEntityID 
inner join Person.PhoneNumberType as phtype on ph.PhoneNumberTypeID=phtype.PhoneNumberTypeID;




--b. Get the details of the sales header order made in May 2011
select * from Sales.SalesOrderHeader where OrderDate between '2011-05-01' and '2011-05-31'



--c. Get the details of the sales details order made in the month of May 2011
select 
*from Sales.SalesOrderDetail as sd inner join Sales.SalesOrderHeader as sod on sd.SalesOrderID=sod.SalesOrderID
where sod.OrderDate between '2011-05-01' and '2011-05-31';

--d. Get the total sales made in May 2011

select * from Sales.SalesOrderDetail

select 
SUM(sd.LineTotal) as total_sale_onMay
from Sales.SalesOrderDetail as sd 
inner join Sales.SalesOrderHeader as sod on sd.SalesOrderID=sod.SalesOrderID
where sod.OrderDate between '2011-05-01' and '2011-05-31';


--e. Get the total sales made in the year 2011 by month order by increasing sales
select 
SUM(sd.linetotal) as Total_Sale,
month(sod.orderdate) as monts
from Sales.SalesOrderDetail as sd 
inner join Sales.SalesOrderHeader as sod on sd.SalesOrderID=sod.SalesOrderID
group by MONTH(sod.OrderDate) order by Total_Sale;


--f. Get the total sales made to the customer with FirstName='Gustavo' and LastName = 'Achong'  select * from Person.Person where Person.FirstName='Gustavo' and Person.LastName='Achong' --BID== 291