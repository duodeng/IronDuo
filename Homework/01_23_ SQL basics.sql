# SELECT *, case when operation = "VKLAO" then "YES" else "No" end from trans; 
# Query 1 :Get the id values of the first 5 clients from district_id with a value equals to 1.
SELECT client_id from bank.client
	where district_id = 1
    limit 5;
    
# Query 2:In the client table, get an id value of the last client where the district_id equals to 72.
SELECT client_id from bank.client
	where district_id = 72
    ORDER BY client_id DESC
    limit 1;
    
# Query 3: Get the 3 lowest amounts in the loan table.
SELECT amount from bank.loan
	ORDER BY amount
	limit 3;
    
# Query 4:What are the possible values for status, ordered alphabetically in ascending order in the loan table?
SELECT distinct status from bank.loan
ORDER BY status;

# Query 5: What is the loan_id of the highest payment received in the loan table?
SELECT loan_id From bank.loan
ORDER BY payments DESC
	limit 1;
    
# Query 6：What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount
SELECT amount, account_id from bank.loan
ORDER BY account_id;

# Query 7:What are the top 5 account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?
SELECT account_id from bank.loan
	where duration = 60 
		ORDER BY amount
			 limit 5;

# Query 8： What are the unique values of k_symbol in the order table?
SELECT distinct k_symbol from bank.order;

# Query 9: In the order table, what are the order_ids of the client with the account_id 34?
SELECT order_id from bank.order
	where account_id = 34 ;
    
# Query 10: In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
SELECT distinct account_id from bank.order
	where order_id > 29540  and order_id <= 29560;
    
# Query 11: In the order table, what are the individual amounts that were sent to (account_to) id 30067122?
SELECT amount from bank.order
	where account_to =  30067122;
    
# Query 12:
select trans_id, date, type, amount from bank.trans
	where account_id = 793
    ORDER BY date DESC 
    limit 10;
    
# Optional 
# Query 13:
select distinct district_id, count(client_id) from bank.client
		group by  district_id # we can use where before group by and having after group by
			having  district_id <10
			ORDER BY district_id; 
            
# Query 14:
select type, count(card_id) as Total_cards from bank.card
	group by type
	ORDER BY Total_cards DESC; 
    
# Query 15:
select account_id, sum(amount) as Total_loan from bank.loan
	group by account_id
    ORDER BY Total_loan DESC
    limit 10;
    
    
    # Query 16
    select date, count(loan_id) as total_loads from bank.loan
     group by date
		having date < 930907
			ORDER BY date DESC; 
            
	# Query 17
    select date, duration, count(loan_id) as total_loads from bank.loan
		where date >= 971201 and date <= 971231 # timestamp is a datetime value in SQL /BETWEEN 971201  AND 971231 
    group by date, duration
    ORDER BY date, duration;
    
    # Query 18
    select account_id,type, sum(amount) as total_amount from bank.trans
		where account_id = 396
        group by type 
        ORDER BY type;
	
    # Query 19
    select account_id, floor(sum(amount)) as total_amount, 
    case 
		when type = "PRIJEM" then "Incoming" 
        when type = 'VYDAJ' then "Outcoming" 
    end as 'transaction_type'
    from bank.trans
    where account_id = 396
    group by type  
	ORDER BY type; 
    
# Query 20
select account_id, 
floor(sum(case when type='PRIJEM' then amount end)) as incoming_amount,
floor(sum(case when type='VYDAJ' then amount end)) as outcoming_amount,
floor(sum(case when type='PRIJEM' then amount end)) - floor(sum(case when type='VYDAJ' then amount end))  as difference
from bank.trans
where account_id = 396
group by account_id;

# Query 21
select account_id, 
floor(sum(case when type='PRIJEM' then amount end)) - floor(sum(case when type='VYDAJ' then amount end)) 
as difference
from bank.trans
group by account_id
order by difference DESC
limit 10;


    
    
		
    
    
    
		
	




 
