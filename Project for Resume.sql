select * from MYSQL3.dbo.data1

select * from data2

---------Total number of rows in table

select count(*) from data1

----------for uttar pradesh & Gujarat

select * from data2 where (state) in ('Gujarat','Uttar pradesh')


----------------Population of India

select sum (population) from data2 

------------Avg groth of country

select state, avg(growth)*100 as Avg_groth from data1 group by state


-------Avg sex ratio

select state, avg(sex_ratio ) AS Avg_sex_ratio from data1 group by state


---------Avg Liracy rate

select state, Avg(literacy) as Avg_Literacy from data1 group by state order by avg_literacy desc

----------Litracy avg more than 80

select state, Avg(literacy) as Avg_Literacy from data1 group by state having ROUND(avg(literacy),0)>80
 order by avg_literacy desc

 --------------Top5 states in Avg groth

 select top 5 (state), avg(growth) as avg_growth from data1 group by state order by avg_growth 

 -----------Top 3 lowest sex ratio
 
 select top 5 state, round(avg(sex_ratio),0) as Avg_sex_ratio from data1 group by state order by avg_sex_ratio asc

 ----------Top 3 state & Bottom state from Litracy_Rate

 Create Table #Topstates
 ( state varchar(50),
 Topstates float

 )

 Insert into #topstates
 select top 5 state, round(avg(Literacy),0) as Avg_Literacy from data1 group by state order by Avg_Literacy asc

 select * from #Topstates

-----------Bottom states

 Create Table #Bottomstatess
 ( state varchar(50),
 Bottomstates float

 )

 Insert into #Bottomstatess
 select top 5 state, round(avg(Literacy),0) as Avg_Literacy from data1 group by state order by Avg_Literacy desc

 select * from #Bottomstatess

 ---------------Union

 select * from #Topstates
 union
  select * from #Bottomstatess

  ----------------States start with letter A

  select * from data1 where ( state) like 'a%'


  ---------Distinct

  select distinct state from Data1

  -------states letter start between A & B

  select * from data1 where ( state) like 'a%' or state like 'b%'

  ---------Inner join

  select data1.District,data1.State,data1.Sex_Ratio,data2.population from data1 inner join data2 on data1.District = data2.District



-------Number of Males and females...( Dought )
( select data1.District, data1.state,data2.Population/((data1.sex_ratio+1) males)) from(
 select data1.District,data1.State,data1.Sex_Ratio/1000,data2.population from data1 inner join data2 on data1.District = data2.District )


 --------Total litracy

 (select data1.District, data1.state, data1.Literacy/100 as Total_litracy, data2.Population from data1 inner join data2 on data1.District=data2.District)
 group by data1.state




