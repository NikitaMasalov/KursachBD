Курсовая работа на тему «Разработка базы данных для сервиса доставки»

ER-диаграмма:

![image](https://github.com/NikitaMasalov/KursachBD/assets/118043414/d18e58e4-631d-4af9-9b64-e8d0e692abb5)

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
