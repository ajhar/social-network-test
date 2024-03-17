## Database Schema Design

Please refer to the following diagram for the database schema design: [Database Schema](https://drive.google.com/file/d/1CUKk8zjnmTbKPQe92OJ85h4b_aGVG2LY/view?usp=sharing)

## Queries and ORM Equivalents

### i. Message List between Users X and Y

**SQL Query:**
```sql
SELECT messages.message, messages.sender_id, users.profile_picture
FROM messages
INNER JOIN users ON messages.sender_id = users.id
WHERE (messages.sender_id = X AND messages.receiver_id = Y)
   OR (messages.sender_id = Y AND messages.receiver_id = X);
```

**Eloquent ORM Equivalent:**
Please refer to the solution in the code route: `/message/list/{from_id}/{to_id}`

### ii. List of Friends of User X

**SQL Query:**
```sql
SELECT u.*
FROM users u
INNER JOIN friendship f1 ON u.id = f1.friend_id
WHERE f1.user_id = X
UNION
SELECT u.*
FROM users u
INNER JOIN friendship f2 ON u.id = f2.user_id
WHERE f2.friend_id = X;
```

**Eloquent ORM Equivalent:**
Please refer to the solution in the code route: `/get_friends/{id}`

### iii. List of Friends of Friends of User X

**SQL Query:**
```sql
SELECT DISTINCT u.*
FROM users u
INNER JOIN friendship f1 ON u.id = f1.friend_id
WHERE f1.user_id IN (
    SELECT u.id
    FROM users u
    INNER JOIN friendship f1 ON u.id = f1.friend_id
    WHERE f1.user_id = X
)
OR f1.user_id IN (
    SELECT u.id
    FROM users u
    INNER JOIN friendship f2 ON u.id = f2.user_id
    WHERE f2.friend_id = X
)
AND (u.id <> X);
```

**Eloquent ORM Equivalent:**
Please refer to the solution in the code route: `/get_friends_of_friends/{id}`
<br/>
<br/>
<br/>
<br/>
**Note:** Each endpoint result is passed to the `dd()` function to clearly see the results.
