---------------
#superbowl commercial analysis
------------------
#Author:sharon omovie
#tool used: mysql workbench
----------------------
#Deleting unwanted columns
alter table superbowl_commercials
drop Superbowl_Ads_Link,
drop Youtube_Link;

#viewing remaining columns
select *
from superbowl_commercials;

#what is the most used style?
select 
sum( case when funny='TRUE' then 1
else 0
end) Funny,
sum( case when Shows_Product_Quickly='TRUE' then 1
else 0
end) Shows_Product_Quickly,
sum( case when Patriotic='TRUE' then 1
else 0
end) Patriotic,
sum( case when Celebrity='TRUE' then 1
else 0
end) Celebrity,
sum( case when Danger='TRUE' then 1
else 0
end) Danger,
sum( case when Animals='TRUE' then 1
else 0
end) Animals,
sum( case when Uses_Sex='TRUE' then 1
else 0
end) Uses_Sex
from superbowl_commercials;

#The most and least view and like 
select max(Youtube_Views) highest_youtube_views, min(Youtube_Views) lowest_youtube_views,max(Youtube_Likes) highest_likes,min(Youtube_Likes) lowest_likes,max(TV_Viewers) hightest_tv_viewers,min(TV_Viewers) lowest_tv_viewers
from superbowl_commercials;

#which commercial has the lowest youtube view?
select *
from superbowl_commercials
where youtube_views=5;

#which commercial has the highest youtube view?
select *
from superbowl_commercials
where youtube_views=181423810;

#which commercial has the highest youtube like?
select *
from superbowl_commercials
where Youtube_Likes=295000;

#which commercial has the lowest youtube like?
select *
from superbowl_commercials
where Youtube_Likes=0;

#which commercial has the highest TV viewers?
select *
from superbowl_commercials
where TV_Viewers=232;

#which commercial has the lowest TV viewers?
select *
from superbowl_commercials
where TV_Viewers=84.34;

#does length of commercial affect views and likes?
select Length,max(Youtube_Views) Max_youtube_view, max(Youtube_Likes) Max_youtube_Likes, max(TV_Viewers) Max_TV_viewers
from superbowl_commercials
group by Length
order by Length;

#does cost affect views and likes
select Estimated_Cost,sum(Youtube_Views) total_youtube_view, sum(Youtube_Likes) total_youtube_likes, sum(TV_Viewers) total_tv_viewers
from superbowl_commercials
group by Estimated_Cost
order by Estimated_Cost desc;

#brand with the most commercials
select brand,count(Brand) count
from superbowl_commercials
group by Brand
order by count desc;

#styles used by brand with most commercial
select brand,
sum( case when funny='TRUE' then 1
else 0
end) Funny,
sum( case when Shows_Product_Quickly='TRUE' then 1
else 0
end) Shows_Product_Quickly,
sum( case when Patriotic='TRUE' then 1
else 0
end) Patriotic,
sum( case when Celebrity='TRUE' then 1
else 0
end) Celebrity,
sum( case when Danger='TRUE' then 1
else 0
end) Danger,
sum( case when Animals='TRUE' then 1
else 0
end) Animals,
sum( case when Uses_Sex='TRUE' then 1
else 0
end) Uses_Sex
from superbowl_commercials
where Brand= 'Bud Light';

#views and like of the most used brand
select brand,max(Youtube_Views) max_youtube_views, max(Youtube_Likes) max_youtube_likes, max(TV_Viewers) max_tv_viewers,max(Estimated_Cost) max_cost,max(Length) max_length
from superbowl_commercials
where Brand= 'Bud Light';

#all commercial done by most used brand
select year,brand,Youtube_Views, Youtube_Likes,TV_Viewers,Estimated_Cost,Length
from superbowl_commercials
where Brand= 'Bud Light';

#trend of commercials over the years
select year,
sum( case when funny='TRUE' then 1
else 0
end) Funny,
sum( case when Shows_Product_Quickly='TRUE' then 1
else 0
end) Shows_Product_Quickly,
sum( case when Patriotic='TRUE' then 1
else 0
end) Patriotic,
sum( case when Celebrity='TRUE' then 1
else 0
end) Celebrity,
sum( case when Danger='TRUE' then 1
else 0
end) Danger,
sum( case when Animals='TRUE' then 1
else 0
end) Animals,
sum( case when Uses_Sex='TRUE' then 1
else 0
end) Uses_Sex,sum( Length) total_length, sum(Estimated_Cost) total_estimated_cost, sum(Youtube_Views) total_youtube_view, sum(Youtube_Likes) total_youtube_views, sum(TV_Viewers) total_tv_viewers
from superbowl_commercials
group by year;

#each stlye and their most view
select 'Funny' as category, max(youtube_views) max_youtube_views, max(Youtube_Likes) max_youtube_likes, max(TV_Viewers) max_tv_viewers
from superbowl_commercials
where Funny='TRUE'
union all
select 'Shows_Product_Quickly' as category, max(youtube_views), max(Youtube_Likes), max(TV_Viewers)
from superbowl_commercials
where Shows_Product_Quickly='TRUE'
union all
select 'Patriotic' as category, max(youtube_views), max(Youtube_Likes), max(TV_Viewers)
from superbowl_commercials
where Patriotic='TRUE'
union all
select 'Celebrity' as category, max(youtube_views), max(Youtube_Likes), max(TV_Viewers)
from superbowl_commercials
where Celebrity='TRUE'
union all
select 'Danger' as category, max(youtube_views), max(Youtube_Likes), max(TV_Viewers)
from superbowl_commercials
where Danger='TRUE'
union all
select 'Animals' as category, max(youtube_views), max(Youtube_Likes), max(TV_Viewers)
from superbowl_commercials
where Animals='TRUE'
union all
select 'Uses_Sex' as category, max(youtube_views), max(Youtube_Likes), max(TV_Viewers)
from superbowl_commercials
where Uses_Sex='TRUE';




