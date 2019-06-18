## Project Purpose: Personal trainer assistance to manage clients' programs and schedules
# Target Audience: professional personal trainers in gyms, doing f2f and online trainings

# State of affairs:
1. Communication. Mostly messengers. As a result - swarming chatrooms, contacts and total mess with dialogs in case, if consultancy services involves not only the sports topics, but lifestyle ones, like scientific approach to sports dietology, relaxing and focal practices or spontaneous sport acquaintances. Current solution: sports-specific multiuser software, mostly trackers with ability to share the results and added media and communicate with other athletes. Pros: it works. Cons: very sports specific, mostly focused not on communication with trainer, but on sharing the personal results. As a trainer-trainee case can cause constantly multiplying use of various sports tracking software (which causes ineffective resource management, i.e. battery draining)
2. Content. Involves: scheduler, diary/blog appliance, muscles atlas, encyclopedia of exercises, supplements base, incoming feedback from trainees (in any format). Existing solutions combine only several of these instruments and has to be combined or augmented with other services. Expanding amount of trainees causes explicit mess in data and management.
3. Personal promotion. Mostly social networks, various types of direct advertising and word-of-mouth. The call to measure the effectiveness of the means applied forces to deep dive into specific advertising campaign management details for each social network, which increases the personal investments or narrows the scope. Participation in events requires constant involvement in public-sports activity, information and schedules on those are spreaded across various sources.

## Use Cases: (@IggyPob)
# Trainer Perspective:
1. As a Trainer I have an access to the Exercise Library (can enumerate the library/favorite smth/add custom tags)
2. As a Trainer I can combine Exercises from library into an Exercise Set (Exercise Set contains number of Sets, Repetitions, Pause Duration, Weights)
3. As a Trainer I can assign previously created/factory Exercise Set to one of my Clients (for a given date)
- Repeatability: 100%
- Scope of applicability: 100% of Trainers
- Related Use Case: line #18
# Client Perspective:
1. As a Client I can see Exercise Sets assigned to me by (a number of) Trainer(s)
2. As a Client I can Execute the Exercise Set, Save Results and Submit Results to Trainer
3. As a Client I have an access to the Exercise Library (can enumerate the library/favorite smth/add custom tags)
4. As a Client I can combine Exercises from library into an Exercise Set (Whereas Exercise Set contains number of Sets, Repetitions, Pause Duration, Weights)
# Functional/Domain Model Perspective:
* 

## Swagger Spec:
### Как сгенерировать и запустить OpenAPI-сервер на основе Python-Flask и Connexion.

#### 1. Описать OpenAPI-спецификацию для поставленой задачи.  
Спеку можно разрабатывать в формате yaml или json. На мой взгляд - формат yaml более нагляден и прост для чтения, OpenAPI-генератор также работает с yaml.  
Спецификация OpenAPI 3 подробно описана в [официальной документации](https://swagger.io/docs/specification/basic-structure/).  
Также можно почитать [пошаговое руководство](https://idratherbewriting.com/learnapidoc/pubapis_openapi_tutorial_overview.html).  
Основная информация о спецификации, а также простые примеры есть в [репозитории](https://github.com/OAI/OpenAPI-Specification/).  

#### 2. Сборка актуальной версии *OpenAPI Generator*.  

##### 2.1. Установка и настройка *Maven*.  
Для того, чтобы собрать текущую версию OpenAPI-генератора, в Вашей системе должен быть установлен инструмент для сборки проектов - Maven.  
Установка и настройка Maven в операционных системах [Windows](https://github.com/Flibberty-GEA/blog/wiki/03.a-%D0%9A%D0%B0%D0%BA-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C-Maven-%D0%BD%D0%B0-Windows-10) и [Linux](https://www.javahelps.com/2017/10/install-apache-maven-on-linux.html).  

##### 2.2. Сборка *OpenAPI Generator*.  
* Клонируем официальный репозиторий проекта:  
`git clone https://github.com/OpenAPITools/openapi-generator`
* Собираем проект при помощи Maven. Переходим в каталог "openapi-generator" и выполняем команду:  
`mvn clean install`  
После завершения процесса сборки, переходим в каталог "openapi-generator/modules/openapi-generator-cli/target/" и находим файл "*openapi-generator-cli.jar*" - это и есть генератор, который мы будем использовать на следующем шаге.  

#### 3. Валидация yaml-спеки и генерация кода Flask-сервера на ее основе.  
* Валидация спеки:  
`java -jar openapi-generator-cli.jar validate -i openapi.yaml`  
Если ошибок не обнаружено - переходим к генерации кода.
* Генерируем Python-код Flask-сервера и помещаем результат работы в подкаталог "out":  
`java -jar openapi-generator-cli.jar generate -i openapi.yaml -g python-flask -o out`
* Другие полезные аргументы командной строки генератора.
	- Просмотр параметров по умолчанию для выбранного генератора:  
	`java -jar openapi-generator-cli.jar config-help -g python-flask`
	- Вывод списка доступных генераторов:  
	`java -jar openapi-generator-cli.jar list`  

#### 4. Запуск OpenAPI-сервера.  
Для работы сгенерированного сервера необходима среда Python версии 3.5 или выше.  
Проблемы возникали с Python-модулем *Connexion*, последняя стабильная версия которого не поддерживала стандарт *OpenAPI 3.0*. Поддержку версии 3.0 добавили [позже](https://github.com/OpenAPITools/openapi-generator/commit/6dc618fa3f5de445837d37fa57369fc187c1c2d4).  
Но нужно устанавливать Connexion непосредственно из официального репозитория (на данный момент - это версия *2018.0.dev1*):  
`python -m pip install git+https://github.com/zalando/connexion.git`  
Также, возможно, потребуется доустановить:  
`python -m pip install connexion[swagger-ui]`  
Сгенерированный сервер запускается при помощи команды:  
`python -m openapi_server`  

#### 5. Доступ к серверу.  
В зависимости от указанных в спеке параметров конфигурации сервера, следующие адреса могут отличаться в Вашем случае.  
Можете открыть в браузере следующие ссылки:  
`http://localhost:8080/v1/openapi.json` - OpenAPI-спецификация в формате json.  
`http://localhost:8080/v1/ui/` - простой UI для ознакомления с возможностями API.  


## Welcome to GitHub Pages

You can use the [editor on GitHub](https://github.com/totus/train/edit/master/README.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/totus/train/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
