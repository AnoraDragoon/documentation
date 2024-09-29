--
-- Show row_data statistics per day in a week
--
SELECT 
count(id) as quantity
, avg(pg_column_size(raw_data ::TEXT) / 1024.0) AS jsonb_data_size_kb_avg
, max(pg_column_size(raw_data ::TEXT) / 1024.0) AS jsonb_data_size_kb_max
, date_part('week', modified_date) as Week
, date_part('month', modified_date) as Month
, date_part('day', modified_date) as Day
FROM inspection.visit v
WHERE date_part('year', modified_date) = 2023
AND date_part('week', modified_date) = 29
GROUP BY date_part('month', modified_date), date_part('day', modified_date), date_part('week', modified_date)
;

--
-- Show row_data statistics for a visit
--
select
pg_column_size(raw_data ::TEXT) / 1024.0 AS jsonb_data_size_kb
, DATE_PART('week', modified_date) as Week
, DATE_PART('month', modified_date) as Month
, DATE_PART('day', modified_date) as Day
from inspection.visit v
where id = 325465
;


CALL inspection.delete_and_insert_visits_hist(:wk, :yy);

call inspection.delete_and_insert_visits_hist(22, 2022);
call inspection.delete_and_insert_visits_hist(23, 2022);
call inspection.delete_and_insert_visits_hist(24, 2022);
call inspection.delete_and_insert_visits_hist(25, 2022);
call inspection.delete_and_insert_visits_hist(26, 2022);
call inspection.delete_and_insert_visits_hist(27, 2022);
call inspection.delete_and_insert_visits_hist(28, 2022);

select *
from inspection.visit_select vs 
WHERE date_part('year', modified_date) = 2022
AND date_part('week', modified_date) = 23
;



--select avg(pg_column_size(raw_data ::TEXT) / 1024.0) AS jsonb_data_size_kb
select pg_column_size(raw_data ::TEXT) / 1024.0 AS jsonb_data_size_kb
, DATE_PART('week', modified_date) as Week
--, count(id) as Quantity
from inspection.visit v
--where id = 325465
where DATE_PART('year', modified_date) = 2022
and DATE_PART('week', modified_date) = 29
--group by DATE_PART('week', modified_date)
;


select avg(pg_column_size(raw_data ::TEXT) / 1024.0) AS jsonb_data_size_kb,
max(pg_column_size(raw_data ::TEXT) / 1024.0) AS jsonb_data_size_kb_max
--select pg_column_size(raw_data ::TEXT) / 1024.0 AS jsonb_data_size_kb
, DATE_PART('day', modified_date) as day
, count(id) as Quantity
from inspection.visit v
--where id = 325465
where DATE_PART('year', modified_date) = 2022
and DATE_PART('week', modified_date) = 30
group by DATE_PART('day', modified_date)
;


-- Eliminar registros de visit_select para los ids q han sido insertados o modificados
select count(id)
, DATE_PART('day', modified_date) as day
, DATE_PART('month', modified_date) as month
--DELETE 
FROM inspection.visit_select
where DATE_PART('year', modified_date) = 2022
and DATE_PART('week', modified_date) = 40
group by DATE_PART('day', modified_date), DATE_PART('month', modified_date)
;

------------------ Other ------------------

select DATE_PART('week', modified_date) as "week", DATE_PART('month', modified_date) as "Month", DATE_PART('year', modified_date) as "Year", DATE_PART('day', modified_date) as "Day"
from visit v 
where DATE_PART('year', modified_date) = 2022;


select count(id) as quantity, DATE_PART('week', modified_date) as "week"
from visit v 
where DATE_PART('year', modified_date) = 2022
and DATE_PART('week', modified_date) = 30
--and DATE_PART('week', modified_date) between 21 and 28
group by DATE_PART('week', modified_date)
;

select count(id) as quantity,
DATE_PART('day', modified_date)
from inspection.visit_select vs 
where DATE_PART('year', modified_date) = 2022
and DATE_PART('week', modified_date) = 40
--and DATE_PART('day', modified_date) = 6
group by DATE_PART('day', modified_date)
;


call delete_and_insert_visits_hist(21, 2022);
call delete_and_insert_visits_hist(22, 2022);
call delete_and_insert_visits_hist(23, 2022);
call delete_and_insert_visits_hist(24, 2022);
call delete_and_insert_visits_hist(25, 2022);
call delete_and_insert_visits_hist(26, 2022);
call delete_and_insert_visits_hist(27, 2022);
call delete_and_insert_visits_hist(28, 2022);
call inspection.delete_and_insert_visits_hist(29, 2022);
call delete_and_insert_visits_hist(30, 2022);


select pg_column_size(v.raw_data) as jsonb_data_size_kb from inspection.visit v where id = 325465;

------------------ Other ------------------

INSERT INTO inspection.visit (id,visitid,fk_campaign_id,biz_id,biz_name,fk_inspection_id,raw_data,start_date,end_date,created_date,modified_date,status,"comments",status_reason,inspector_id,created_by,modified_by) VALUES
	 (429,'EDEDCCE2-E927-41FF-B48D-B8076B2C8AD4',35,'B56580123','Abrahams',90,'{"bizId": "B56580123", "status": "ongoing", "bizName": "Abrahams", "endDate": "", "removed": "", "visitId": "EDEDCCE2-E927-41FF-B48D-B8076B2C8AD2", "onthefly": false, "startDate": "07/07/2023 11:31", "campaignId": "35", "inspectorId": "inspector", "businessCode": "B56580123", "statusReason": "", "visitLocation": [null, null]}','07/07/2023 11:31',NULL,'07/07/2023 04:38','2023-07-07 04:38:33.807','ONGOING',NULL,'','inspector','inspector','inspector');

update inspection.visit 
set raw_data = '{"bizId": "B56580123", "status": "ongoing", "bizName": "Abrahams", "endDate": "", "removed": "", "visitId": "EDEDCCE2-E927-41FF-B48D-B8076B2C8AD2", "onthefly": false, "startDate": "07/07/2023 11:31", "campaignId": "35", "inspectorId": "inspector", "businessCode": "B56580123", "statusReason": "", "visitLocation": [null, null]}'
where id = 127;


update inspection.visit 
set raw_data = '{"bizId": "B56580123", "status": "ongoing", "bizName": "Abrahams", "endDate": "", "removed": "", "visitId": "EDEDCCE2-E927-41FF-B48D-B8076B2C8AD2", "onthefly": false, "startDate": "07/07/2023 11:31", "campaignId": "35", "inspectorId": "inspector", "businessCode": "B56580123", "statusReason": "", "visitLocation": [null, null]}'
where id = 127;

select distinct count(*)
from inspection.visit_select vs 


--select avg(pg_column_size(raw_data ::TEXT) / 1024.0) AS jsonb_data_size_kb
select 
-- pg_column_size(raw_data ::TEXT) / 1024.0 AS jsonb_data_size_kb
count(id) as quantity
, avg(pg_column_size(raw_data ::TEXT) / 1024.0) AS jsonb_data_size_kb_avg
, max(pg_column_size(raw_data ::TEXT) / 1024.0) AS jsonb_data_size_kb_max
, DATE_PART('week', modified_date) as year_week
, DATE_PART('month', modified_date) as month_number
, DATE_PART('day', modified_date) as month_day
--, count(id) as Quantity
from inspection.visit v
--where id = 325465
where DATE_PART('year', modified_date) = 2022
and DATE_PART('week', modified_date) = 30
group by DATE_PART('month', modified_date), DATE_PART('day', modified_date), DATE_PART('week', modified_date)
;

select * 
from inspection.visit v 
where (pg_column_size(raw_data ::TEXT) / 1024.0) > 5000

--select count(id)
select id
--delete
from inspection.visit_select vs 
where DATE_PART('year', modified_date) = 2022
and DATE_PART('week', modified_date) = 30
and id in (
	select id
	from inspection.visit v
	where DATE_PART('year', modified_date) = 2022
	and DATE_PART('week', modified_date) = 30
	and DATE_PART('day', modified_date) = 29
);

select id, pg_column_size(raw_data ::TEXT) / 1024.0 AS jsonb_data_size_kb
, DATE_PART('week', modified_date) as year_week
, DATE_PART('day', modified_date) as month_day
from inspection.visit v
--where DATE_PART('year', modified_date) = 2022
--and DATE_PART('week', modified_date) = 30
--and DATE_PART('day', modified_date) = 29
where id = 4401
--and pg_column_size(raw_data ::TEXT) / 1024.0 in (
--	select max(pg_column_size(raw_data ::TEXT) / 1024.0)
--	from inspection.visit v
--	--where id = 325465
--	where DATE_PART('year', modified_date) = 2022
--	and DATE_PART('week', modified_date) = 30
--	group by DATE_PART('month', modified_date), DATE_PART('day', modified_date), DATE_PART('week', modified_date)
--)
;


SELECT * FROM inspection.visit v
LEFT JOIN inspection.visit_select vs
ON v.id = vs.id
AND v.modified_date = vs.modified_date 
WHERE COALESCE(vs.id) IS NULL
AND DATE_PART('year', v.modified_date) = 2023
AND DATE_PART('month', v.modified_date) = 7
AND DATE_PART('day', v.modified_date) = 29
;

call delete_and_insert_visits_hist_by_day(25,7,2022);

select *
from inspection.visit v 
inner join inspection.ins_campaign ic 
on v.fk_campaign_id = ic.id_ins_campaign 
where ic.name_ins_campaign like '%camp2 OS%';

select *
from inspection.visit v 

select *
--select count(*)
from inspection.ins_team it
where it.id not in (select it2.xid_ins_team from inspection.ins_teaminspectors it2 group by it2.xid_ins_team);

--select it2.xid_ins_team
select count(it2.xid_ins_team)
from inspection.ins_teaminspectors it2 
group by it2.xid_ins_team;

select count(id)
from inspection.ins_team it;

select count(it2.xid_ins_team), max(it2.id_ins_teaminspectors)
from inspection.ins_teaminspectors it2
where 1 < (select count(it2.xid_ins_team) from inspection.ins_teaminspectors it2)
group by it2.xid_ins_team;


select it.id, it2.xid_ins_team, it2.id_ins_teaminspectors, it."name", it2.inspector
from inspection.ins_team it
inner join inspection.ins_teaminspectors it2 
on it.id = it2.xid_ins_team 
where "name" like '%team%'

update inspection.ins_teaminspectors it2
set inspector = 'inspector'
where it2.id_ins_teaminspectors = 704919

update inspection.ins_team it
set "name" = 'AAA Test team B'
where "name" = 'Test team B';

select it.id , it."name" , ic.*
from inspection.ins_team it 
inner join inspection.ins_campaignteams ic 
on it.id = ic.xid_ins_team 
inner join inspection.ins_campaign ic2 
on ic.xid_ins_campaign = ic2.id_ins_campaign 
--where id = 704917
;

insert into inspection.ins_campaigninspectors values (704932,'inspector_test',704929);

insert into inspection.ins_campaignteams values (pk_id, xid_ins_campaign, xid_ins_team);

select max(id_ins_campaigninspector) 
from inspection.ins_campaigninspectors;


--
-- Query to get Information for DMS endpoint.
--
SELECT scans ->> 'date' as last_date,
v.biz_name,
scans -> 'product' ->> 'status' as status
FROM inspection.visit v,
LATERAL jsonb_array_elements(v.raw_data -> 'scans') AS scans
WHERE scans ->> 'code' = '3SKZVD8R5ZWA41932NJZ8N';

--
-- Group by inspectors and teams
--
select inspector, xid_ins_team, count(id_ins_teaminspectors) as quantity
--select *
from inspection.ins_teaminspectors it 
group by inspector , xid_ins_team

--
-- Get first row
--
select *
from inspection.ins_campaigninspectors ic
where id_ins_campaigninspector = (select min(id_ins_campaigninspector) from inspection.ins_campaigninspectors)
;


CALL inspection.delete_and_insert_visits_hist_by_day(17, 7, 2023);

select min(id_ins_campaigninspector) from inspection.ins_campaigninspectors;

--
-- Get first row
--
select *
from inspection.ins_teaminspectors it
where id_ins_teaminspectors = (select min(id_ins_teaminspectors) from inspection.ins_teaminspectors)


--
-- Get Visit_select in a week
--
select *
from inspection.visit_select vs 
where DATE_PART('year', modified_date) = 2023
and DATE_PART('week', modified_date) = 29

select *
from inspection.visit_select vs 
WHERE date_part('year', modified_date) = 2022
AND date_part('week', modified_date) = 23

--
-- FAT BI report R14 Datos duplicados en los reportes.
--
select *
from inspection.ins_campaign ic 
where id_ins_campaign = 24999

select *
from bi.vwm_visits_detail vvd 
where visit_id = 28426
;

select *
from bi.vwm_product_scans vps
where visit_id = 28426
;

select *
from bi.vwm_product_types vpt 
where producttype like '%2204 - %'
;

--
-- Product type repeated
--
select *
from bi.vwm_product_types vpt 
where id = '20'
;

select id, count(id) as quantity
from bi.vwm_product_types vpt 
group by id
having count(id) > 1
;

select *
from bi.vwm_visits vv 
where visit_id = 28426
;

select *
from bi.vwm_visits_id vvi  
where visit_id = 28426
;

select *
from bi.vwm_visits_issues vvi 
where visit_id = 28426
;

select *
from bi.vwm_visits_issues_by_scanid vvibs 
where visit_id = 28426
;

select *
from bi.vwm_visits_issues_prof vvip 
where id = 28426
;

select *
from bi.vwm_visits_scans vvs 
where visit_id = 28426
;

select *
from bi.vwm_visits_scans vvs 
where visit_id = 28418
;

select *
from bi.vwm_visits_scans vvs 
where fk_campaign_id = 28406
;

-- MINT-26755 Correct User-Team Relationship in Horizon
-- Check campaigns with one inspector asigned
--
select xid_ins_campaign, count(inspector), min(inspector) 
from ins_campaigninspectors ic
group by ic.xid_ins_campaign
having count(inspector) = 1
;

--
-- Check campaigns with more than one inspector asigned
--
select xid_ins_campaign , xid_ins_team , count(id_ins_campaignteam) 
from ins_campaignteams ict
group by xid_ins_campaign , xid_ins_team 
order by xid_ins_campaign 
;

select it.xid_ins_team , count(it.inspector), min(it.inspector) 
from ins_teaminspectors it 
inner join ins_campaignteams ict
on it.xid_ins_team = ict.xid_ins_team 
group by it.xid_ins_team 
having count(it.inspector) = 1
order by it.xid_ins_team 
;

select  iti.xid_ins_team ,count(iti.inspector), min(iti.inspector), ic.xid_ins_campaign,count(ic.inspector), min(ic.inspector)
from ins_campaigninspectors ic
inner join ins_teaminspectors iti
on ic.inspector = iti.inspector 
group by ic.xid_ins_campaign, iti.xid_ins_team 
having count(ic.inspector) = 1
order by iti.xid_ins_team 
;

--
-- Select campaign team relation by inspectors not present in ins_campaignteams Table (Solution for insertion)
--
select ic.xid_ins_campaign, iti.xid_ins_team 
from ins_campaigninspectors ic
inner join ins_teaminspectors iti
on ic.inspector = iti.inspector 
LEFT JOIN ins_campaignteams ic2
USING (xid_ins_campaign, xid_ins_team)
--ON ic.xid_ins_campaign = ic2.xid_ins_campaign 
--AND iti.xid_ins_team = ic2.xid_ins_team 
where ic2.xid_ins_campaign is null
group by ic.xid_ins_campaign, iti.xid_ins_team 
order by ic.xid_ins_campaign 
;


select xid_ins_campaign, count(inspector) 
from ins_campaigninspectors ic
group by ic.xid_ins_campaign
having count(inspector) > 1
;

select it.xid_ins_team , count(it.inspector)
from ins_teaminspectors it 
inner join ins_campaignteams ict
--on it.xid_ins_team = ict.xid_ins_team 
--group by it.xid_ins_team 
having count(it.inspector) > 1
order by it.xid_ins_team 
;

select it.xid_ins_team , count(it.inspector)
from ins_teaminspectors it 
inner join ins_campaignteams ict
on it.xid_ins_team = ict.xid_ins_team 
group by it.xid_ins_team 
having count(inspector) > 1
order by it.xid_ins_team
;

