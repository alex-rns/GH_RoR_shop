# **GeekHub X | RoR | Homework 11**

![site_screen](https://user-images.githubusercontent.com/23439223/105531359-dbd56080-5cf1-11eb-9779-1cae320867f3.jpg)

## Description
This project was created to practice ruby.

## Assigned task

Сейчас мы приступаем к написанию своего собственного магазина и пусть розетка трепещет т.к. скоро появятся у неё конкуренты!

## Steps

Итак что нужно сделать!
- Создать новый проект в новом репозитории
- Создать модели:
- Product
- Category
- User
- Прикрутить bootstrap к проекту и все вьюхи оформлять по сетке бутстрапа
- Страницу с товаром разбить на сетку, смотрите как это сделано на реальных интернет магазинах
- Сделайте хедер(панель навигации) на сайте со статическими страницами также поиском
- Сделать поиск через автокомплит
- При клике на категорию для получение определенных товаров - выделить категорию
- Создать сортировки товаров на странице (от большей цены до меньшей и наоборот, по алфавиту)
- Сделать фильтрация товара по цене(нужно ввести максимальну и минимальную другими словами диапазон цены). Также смотрите примеры в реальной жизни например на розетке
- Добавить ЧПУ можно пока гемы не использовать а заюзать to_param(https://apidock.com/rails/ActiveRecord/Base/to_param)
- Добавить пагинацию


# **GeekHub X | RoR | Homework 12**

![site_screen](https://user-images.githubusercontent.com/23439223/105531609-4090bb00-5cf2-11eb-82db-229cf7894cd4.jpg)

## Assigned task

Продолжаем модифицировать наш магазин:

## Steps

1. Установить и настроить гем Devise для сущности User
2. Установить и настроить гем Activeadmin,
3. Добавить подкатегории для категория товаров. Создать несколько подкатегорий для каждой категории.
4. Добавить сущность  Cart, реализовать возможностью добавления продукта в корзину. Важно, чтобы каждый товар в корзине был уникальным. Если в корзине уже есть товар, а мы пробуем ещё раз добавить его, то должно просто измениться количетсво айтемов в корзине. Также в корзине должен быть функционал увеличение/уменьшение количества айтемов
5. Создать сущность Order, реализовать возможность оформления заказа.
6. Загружаем наши файлы на S3

## Literature

https://github.com/heartcombo/devise
https://github.com/activeadmin/activeadmin
https://edgeguides.rubyonrails.org/active_storage_overview.html#s3-service-amazon-s3-and-s3-compatible-apis
https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/setup-config.html инструкция как получить креды для S3

# **GeekHub X | RoR | Homework 13**

![site_screen](https://user-images.githubusercontent.com/23439223/106315695-4fd4b300-6274-11eb-9b45-b3bf1dea0fa0.jpg)

## Assigned task

И так осталось ещё пару шагов и наш магазин будет готов, и так что нам нужно сделать::

## Steps

1. Модключить мейлер используя Gmail
2. Должны отправляться имейлы после оформления заказа, с перечнем товаром (поработайте на вьюхой имейла, чтобы она была красивая и информативная). После того как мы отправляем имейл мы должны: переводить наш заказ в статус "выполнен" (тем самым мы деактивируем корзину) а так же переадресовываем пользователя на главную страницу (не забываем об сообщении об успешно выполненном заказе на вьюхе)
3. Добавить сущность комментарии для продуктов и пользователей, с полями body & rating.
4. Пользователь может оставить только 1 коментарий с рейтингом для товара заказ на который он оформил (заказ должен находиться в статусе "выполнены"). Используйте валидацию со скоупом.
5. Пользователь может создавать, редактировать и удалять свой комментарий.
6. На странице продукта, мы должны отображать: название товара, описание, цену, категорию, картинку и общий рейтинг товара (среднее арифметическое всех оценок пользователей для этого товара)
7. Добавить возможность авторизации с помощью гема omniauth, используя github как провайдер.
8. Вытягивать из данных приходящих от провайдера имя пользователя (и записывать эти данные в базу).
*. По-желанию добавить доп провайдеры для авторизации facebook/google.

## Literature

https://guides.rubyonrails.org/action_mailer_basics.html
https://github.com/omniauth/omniauth
https://github.com/omniauth/omniauth-github
https://github.com/heartcombo/devise
gem 'devise', github: 'heartcombo/devise', branch: 'ca-omniauth-2' - devise version with omniauth
https://github.com/cookpad/omniauth-rails_csrf_protection

# **GeekHub X | RoR | Homework 14**

![site_screen](https://user-images.githubusercontent.com/23439223/107129013-f8b18c80-68ca-11eb-8823-d6f7d89261ad.png)

## Assigned task

Задача простая – надо закинуть ваш интернет-магазин на Диджитал оушен.

https://drum-shop.sytes.net/