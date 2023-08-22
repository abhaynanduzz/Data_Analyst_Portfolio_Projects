create database vrinda_stor;
use vrinda_stor;
#scheme of table
describe vrinda;

select * from vrinda;

# ? Highest selling category? 
select  category,sum(amount) as amount from vrinda  where amount group by category ;


#? Which channel is contributing to maximum sales?
select  Channel ,sum(amount) as amount from vrinda  where amount group by Channel ;


#created a new column Age_group
Alter table vrinda
Add column Age_group varchar(20);

#inserted values
update vrinda
set age_group= case when age>=50 then 'Senior' 
when age >=30 then 'Adult'
else "Teenager"
end;


select * from vrinda;

#created a new column Month
ALTER TABLE vrinda
ADD COLUMN Month INT;

select * from vrinda;

#update Date column datatype to date
UPDATE `vrinda`
SET `Date` = STR_TO_DATE(`Date`, '%d-%m-%Y');


#extracted month from date column
UPDATE vrinda
SET Month = Month(date);

select * from vrinda;


# ? List top 10 states contributing to the sales?
select `ship-state`, sum(amount)as amount from vrinda where amount group by  `ship-state` order by  amount Desc;


#? what are different order status in 2022?
select Status, count(`order id`) as c from vrinda group by Status order by c desc ;


# ?Who purchased more – men or women in 2022?
select gender ,sum(amount) as amount from vrinda group by gender;


# ?Which month got the highest sales and order?
select month, sum(amount) as amount from vrinda group by month order by amount desc;


