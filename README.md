Курсовая работа на тему «Разработка базы данных для сервиса доставки»

ER-диаграмма:

![image](https://github.com/NikitaMasalov/KursachBD/assets/118043414/d18e58e4-631d-4af9-9b64-e8d0e692abb5)

Типовые запросы:

-- Типовой запрос на пользователей оплачивующих покупки наличкой
```
SELECT * 
FROM mydb.user
where user.payment = 'Cash';
```
-- Самые дешевое блюдо из категории Пицца
```
SELECT *
FROM mydb.category_has_product
join product ON category_has_product.product_id = product.id
join category on category_has_product.Category_id = category.id
where category = "Пицца"
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
-- Запрос на просмотр заказов из ресторана "Кинг фуд"
```
SELECT product.name, order.status, order.datetime
FROM mydb.order_has_product
join product ON order_has_product.product_id = product.id
join mydb.order ON order_has_product.order_id = order.id
WHERE product.Restaurant = 'Кинг фуд' ;

```
