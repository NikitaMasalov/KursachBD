Курсовая работа на тему «Разработка базы данных для сервиса доставки»

ER-диаграмма:

![image](https://github.com/NikitaMasalov/KursachBD/assets/118043414/c4a5c434-4d2c-4765-b4cc-568edf35321b)

Типовые запросы:

-- Запрос на получение самых популярных продуктов:
```
SELECT p.name, COUNT(*) AS order_count
FROM orders_has_product op
JOIN product p ON op.product_id = p.id
GROUP BY op.product_id
ORDER BY order_count DESC
LIMIT 10;
```
-- Самые дешевое блюдо из категории Пиццы
```
SELECT *
FROM mydb.category_has_product
join product ON category_has_product.product_id = product.id
join category on category_has_product.Category_id = category.id
where category = "Пиццы"
order by product.price ASC
limit 1;
```
-- Запрос на просмотр заказов которые еще не взяли курьеры 
```
SELECT * 
FROM mydb.order
where order.deliveryman_id IS NULL;
```
-- Запрос на просмотр доставщика который доставил больше всего заказовa
```
SELECT * 
FROM mydb.deliveryman
order by deliveryman.Orders DESC
limit 1;
```
-- Запрос на просмотр заказов из ресторана "Кафе "Гриль Хаус""
```
SELECT product.name, order.status, order.datetime
FROM mydb.order_has_product
join product ON order_has_product.product_id = product.id
join mydb.order ON order_has_product.order_id = order.id
WHERE product.Restaurant = 'Кафе "Гриль Хаус"' ;

```
-- Транзакция для создания заказа
```
START TRANSACTION;

SELECT address INTO @user_address FROM user WHERE id = 3;

INSERT INTO orders (price, status, address, payment, order_time, user_id)
VALUES (0.00, 'accepted', @user_address, 'Online', NOW(), 3);

SET @order_id = LAST_INSERT_ID();

INSERT INTO orders_has_product (orders_id, product_id, Count)
VALUES (@order_id, 4, 2), (@order_id, 3, 1);

SELECT SUM(p.price * o.Count) INTO @total_price
FROM orders_has_product o
JOIN product p ON o.product_id = p.id
WHERE o.orders_id = @order_id;

UPDATE orders
SET price = @total_price,
order_time = NOW()
WHERE id = @order_id;

COMMIT;
```
