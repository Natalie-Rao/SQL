#MS SQL Server

with a as (
select group_id,player_id,first_score as score from Players P, Matches M where P.player_id = M.first_player
union all
select group_id,player_id,second_score as score from Players P, Matches M where P.player_id = M.second_player
),

b as (
    
    select group_id,player_id, sum(score) as total_score
    from a 
    group by group_id,player_id
)

select group_id,player_id from
(select group_id,player_id,row_number() over(partition by group_id order by total_score desc,player_id) as rank from b)as temp
where rank = 1
