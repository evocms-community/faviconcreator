## Favicon Creator for Evolution CMS

<img src="https://img.shields.io/badge/PHP-%3E=5.6-green.svg?php=5.6"> <img src="https://img.shields.io/badge/EVO-%3E1.4.0-blue.svg"> <img src="https://img.shields.io/badge/CS-%3E=1.2.1-yellow.svg">

Плагин для конвертации изображения в favicon.ico. Работает с модулем ClientSettings. После конвертации иконка кладется в корень сайта с именем `favicon.ico`.

### Параметры плагина

<table width="100%">
<tr><th>Имя параметра</th><th>Значение по умолчанию</th><th>Описание</th></tr>
<tr><td>sizes</td><td>16,32,64</td><td>Размеры генерируемых иконок, через запятую. Все размеры помещаются в один файл</td></tr>
<tr><td>field</td><td>favicon</td><td>

Имя поля из конфигурации ClientSettings, в котором содержится изображение иконки.

Для значения по умолчанию конфигурация может быть такой:
```php
'favicon' => [
    'caption' => 'Фавикон',
    'type' => 'image',
],
```

</td></tr>
</table>

