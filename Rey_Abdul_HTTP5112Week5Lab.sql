/*
This data refers to the weeks starting March 6th, 2023. The schedule is for two weeks, and you cannot assume it repeats in the future.

A value of 1 in the shift column means the librarian will work in the morning. A value of 2 means afternoon. Actual start and end times of these shifts are variable, so don't sweat that.

In your own database, normalize this data by creating tables and representing this data. It is okay to add data, alter data formatting & add columns.

After normalizing, write two queries for your lab (and I'll also take a look at your tables and columns, so don't drop them!):

1. One that can tell me the names and shifts of the librarians working not the first Monday, but the Monday after, and
2. One that can tell me Beverly Cleary's assignments for that day.

Your tables should:
...duplicate data as little as possible.
...have no one-to-one relationships that you can't justify.
...have no many-to-many relationships that aren't mediated by a bridging table.
...have one table for each type of entity (person, place, thing, event).
...have one cell for 1 datum (piece of data).
...maintain referential integrity with keys.
...maintain data integrity with constraints and referential actions.
...maintain semantics with data types.

Your queries should:
...still return good data if the table data were to change (e.g. don't hard-code values if you don't have to).
...be as accurate as possible (e.g. avoid false positives wherever you can).

*/

-- 1 Creating tables


