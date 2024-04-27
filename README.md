RU:
Скрипт для осуществления некоторых операций с смс на модемах ZTE серии MF с веб-страницей в режиме RNDIS, без использования дополнительного софта или АТ команд.
Позволяет пользоваться интернетом и слать смс одновременно (интернет отключается и подключается для отправки смс самостоятельно).

Написано и протестировано на MF823D.
Кириллица и ,./\;:[]()|~-=+- символы работают.

Опции:
-c     Создать смс. Пример: -c +1234567890 'сообщение' (Должно быть между ' !)
-a     Показать все смс
-u     Показать непрочитанные
-r     Показать прочитанные
-s     Показать отправленные
-i     Удалить смс по id. Пример: -i 50
-p     Удалить все смс


ENG:
Script for doing some sms actions on ZTE MF series modems with web-page and RNDIS mode, without using smstools or AT commands.
Allows use internet and send sms together (internet auto disconnects and connects itself for sending sms).

Writed and tested on MF823D.
Cyrillic and ,./\;:[]()|~-=+- symbols works

Options:
-c     Create sms. Example: -c +1234567890 'message' (Must be within ' !)
-a     Show all sms
-u     Show unread sms
-r     Show read sms
-s     Show sent sms
-i     Delete sms by id. Example: -i 50
-p     Delete all sms
