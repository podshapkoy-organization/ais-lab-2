# ais-lab-2
**Development of a decision support system based on a knowledge base or ontology**

Целью этой лабораторной работы является разработка программы (рекомендательной системы), которая будет использовать базу знаний или онтологию для предоставления рекомендаций на основе введенных пользователем данных. (Knowledge-based support system)


`ru` **Задание**

- Создать программу, которая позволяет пользователю ввести запрос через командную строку. Например, информацию о себе, своих интересах и предпочтениях в контексте выбора видеоигры - на основе фактов из БЗ (из первой лабы)/Онтологии(из второй).
- Использовать введенные пользователем данные, чтобы выполнить логические запросы к  БЗ/Онтологии.
- На основе полученных результатов выполнения запросов, система должна предоставить рекомендации или советы, связанные с выбором из БЗ или онтологии.
- Система должна выдавать рекомендации после небольшого диалога с пользователем.

**Пример**

Входная строка:

Мне 13 лет, мне нравятся: RPG, инди-игры

**Нужно**

Спарсить строку, разбить на факты, построить запрос, используя эти предикаты. (Формат входной строки фиксированный, искать частичное соответсвие подстроки не нужно)

**Критерии оценки**

- Корректность и эффективность реализации системы поддержки принятия решения.
- Способность программы адекватно использовать базу знаний или онтологию для выдачи рекомендаций.
- Качество тестирования и обработка ввода пользователя.
- Качество документации и описание работы системы.

`eng` **Task**

- Create a program that allows the user to enter a query via the command line. For example, information about yourself, your interests and preferences in the context of choosing a video game - based on facts from the BZ (from the first lab)/Ontology (from the second one).
- Use user-entered data to make logical queries to the database/Ontologies.
- Based on the results of query execution, the system should provide recommendations or tips related to the choice of a database or ontology.
- The system should issue recommendations after a short dialogue with the user.

**Example**

The input string:

I'm 13 years old, I like: RPG, indie games

**Need to**

Parse the string, break it down into facts, and build a query using these predicates. (The format of the input string is fixed, there is no need to search for a partial match of the substring)

**Evaluation criteria**

- Correctness and effectiveness of the implementation of the decision support system.
- The ability of the program to adequately use the knowledge base or ontology to make recommendations.
- Quality of testing and processing of user input.
- Quality of documentation and description of the system operation.
