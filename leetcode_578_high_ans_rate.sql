-------------------Solution 1 -------------------------------

/* Write your T-SQL query statement below */

select top 1 (question_id) as survey_log

from 
(select  a.question_id , isnull(answer*1.0/show,0) as sl from 
(select 
id,
question_id,
count(*) as show
from surveyLog
where action = 'show'
group by id , question_id) a

left join 

(select 
id,
question_id ,
count(*) as answer
from surveyLog
where action = 'answer'
group by id , question_id) b
on a.id=b.id and a.question_id=b.question_id) final

order by sl desc , final.question_id asc


-----------------------SOLUTION 2----------------------------------

select top 1 (question_id) as survey_log 
from 
    (select 
    question_id,
    sum(Case when action = 'answer' then 1 else 0 end)*1.0 /sum(Case when action = 'show' then 1 else 0 end) as answer_rate
    from SurveyLog
    group by question_id) a 

order by a.answer_rate desc , a.question_id asc

