from pyswip import Prolog

prolog = Prolog()
prolog.consult("knowledge_base/lab1.pl")


def input_inf():
    zombie_type = input("Введите тип зомби: ").strip().lower()
    difficulty = input("Введите уровень сложности: ").strip().lower()
    lane_type = input("Тип передвижения: ").strip().lower()
    return zombie_type, difficulty, lane_type


def get_rec(zombie, difficulty, lane_type):
    query = f"recommend_plants({zombie}, {difficulty}, {lane_type}, Plants)."
    result = list(prolog.query(query))

    if result:
        plants = result[0]['Plants']
        return f"Рекомендуемые растения для {zombie} на {difficulty} уровне сложности: {plants}"
    else:
        return "Нет рекомендаций для данных условий."


if __name__ == '__main__':
    zombie, difficulty, lane_type = input_inf()
    recommendations = get_rec(zombie, difficulty, lane_type)
    print(recommendations)
