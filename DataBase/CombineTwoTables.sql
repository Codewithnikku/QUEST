SELECT 
    p.firstName, 
    p.lastName, 
    a.city, 
    a.state
FROM 
    Person p
LEFT JOIN 
    Address a
ON 
    p.personId = a.personId;


    /*
    Intuition:
    We need to combine the information from the Person and Address tables.
    The Person table contains the personal information of each person,
    while the Address table contains the address information of each person.
    We want to include all the people from the Person table,
    whether they have an address in the Address table or not.
    Therefore, we use a LEFT JOIN to combine the two tables based on the personId.


Approach:
    1. We start by selecting the firstName, lastName, city, and state columns from the Person and Address tables.
    2. We then use a LEFT JOIN to combine the two tables based on the personId.
    3. The LEFT JOIN ensures that we include all the people from the Person table,
       whether they have an address in the Address table or not.
    4. If a person does not have an address, the city and state columns from the Address table will be NULL.

    Time Complexity: O(n)
    Space Complexity: O(n)
*/
