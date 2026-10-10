# ecommerce_db - SQL Project

My first complete Ecommerce Database built in MySQL. This is an internship-ready project with 5 real tables.

## Tables Created
- **product** (productid, productname, description, price, stockquantity, category, productlauncheddate, dateadded)
- **user** (userid, username, email, password, address, dateregistered)
- **orders** (ordersid, userid, orderdate, totalamount)
- **review** (reviewid, productid, userid, rating, review)
- **payments** (paymentid, ordersid, paymentmethod, paymentdate, amount)

## Concepts Covered
- Primary Key & Foreign Key
- AUTO_INCREMENT
- DEFAULT curdate()
- CHECK constraint on productlauncheddate
- Handling NULL values
- JOINs between product, user, orders

## Files
- `ecommerce_db.sql` - Complete database with all tables and data
- Sample queries: Find products never reviewed, total revenue, latest users

## Author
Rajnandini Tarse | Pune
GitHub: rajnandini17tarse
Aspiring SQL Developer
