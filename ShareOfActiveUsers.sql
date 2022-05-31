select 

count(case when status='open' then user_id else null end )
/count(*)::FLOAT as ratio_of_active_users

from fb_active_users
WHere country ='USA'