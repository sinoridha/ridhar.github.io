---
title: "Add Proper Index Table For Slow Query MYSQL"
date: 2021-01-13T05:02:45+07:00
draft: false
categories:
- Software
tags:
- mysql
---

For software engineer especially on the backend, might have faced issue slow query in the Production environment.
This happens when the query that builds in the development environment only has small data set and shows good query time.
Maybe first-time query landing on production environment everything just fine, just like a time bomb, production dataset getting bigger and the query time is slowing down and your alert system notifies you for the slow query, or database CPU got high. If you are unlucky (don't have a good alert system) and your boss will alert you and it is time for you to hurry and hotfix.

If you have identified the problem slow query, the quick solution is to add more indexes to the related table. Adding more index comes with a cost, it is affect writing performance. But at that time it is your quickest fix you can take.

If you are guessing when decide which columns table to be added and your database are MYSQL, you might try `EXPLAIN` command of MYSQL to get insight into what your query did. Here a quick example of how `EXPLAIN` command will help you.

You have found this query is slow in your production database.
```
SELECT h.*
FROM h INNER JOIN p ON h.id = p.h_id
WHERE p.d_id = 26356
```

This query takes for (Hold your comment I know its consider a fast query but you will see the difference next)

![Example image](../query_before.png)

Then you can run `EXPLAIN` before your query
```
EXPLAIN SELECT h.*
FROM h INNER JOIN p ON h.id = p.h_id
WHERE p.d_id = 26356
```

And you will get this

![Example image](../explain_before.png)

> Details explanation of output of command `EXPLAIN` you will get in here https://dev.mysql.com/doc/refman/5.6/en/explain-output.html


See red mark on column `key` and the first row, it means your query look over table `p` without index, identified by `null` value.
Then you see a red mark on column `rows` and the first row, for `p` table MySQL do examine `218404` row in the table, this is total data in table `p`. And on `Extra`, it tells that examines `p` table is using where condition not index.

And you need to see a red mark on columns `ref` and the second row and this is what you are looking at. This is the table column that you need to add the index. In this example I add index for column `p.h_id` with index name `idx_h_id`.

If in your case the value of `ref` is you think is not relevant, you need to decide by yourself which column to add a new index to reduce the high value of `row`. The lower number of `row` will faster your query.

Now if I run `EXPLAIN` again the result will be like this.

![Example image](../explain_after.png)

See the `row` value decrease from `218404` to `10` and on table `p` row the new index `idx_h_id` is used in the query process.
And the query time is faster now. On `Extra` it tells that `p` table is now using index while scanning.

![Example image](../query_after.png)

Hope it helps you! Put your comment below.


