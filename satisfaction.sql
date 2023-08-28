use united;

SELECT flight_number, count(flight_number) FROM satisfaction
GROUP by 1;

select * from satisfaction;

select response_group, count(*) from satisfaction
where response_group != 'NBK'
group by response_group;

select distinct number_of_legs from satisfaction;
select avg(score) from satisfaction;

select count(*)/count(distinct flight_number) as 'Average number of feedbacks per flight' from satisfaction;

/*select satisfaction_type, count(*) from satisfaction 
where satisfaction_type is NOT NULL
group by satisfaction_type;

