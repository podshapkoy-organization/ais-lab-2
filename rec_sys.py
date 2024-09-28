import janus_swi as janus


def invalid_input_message():
    print("Некорректный ввод :( Пожалуйста, введите допустимое значение :)")


def input_pref():
    print("Пожалуйста, ответьте на следующие вопросы:")

    while True:
        plant_type = input(
            "Какие растения выберете (Защитные/Атакующие/Поддерживающие)? ").strip().lower()
        if plant_type in ["защитные", "атакующие", "поддерживающие"]:
            break
        else:
            invalid_input_message()

    while True:
        difficulty = input("Какой уровень сложности (Легкий/Средний/Сложный)? ").strip().lower()
        if difficulty in ["легкий", "средний", "сложный"]:
            break
        else:
            invalid_input_message()

    while True:
        time_of_day = input(
            "Какое время суток (Днем/Ночью/Не имеет значения)? ").strip().lower()
        if time_of_day in ["днем", "ночью", "не имеет значения"]:
            break
        else:
            invalid_input_message()

    return plant_type, difficulty, time_of_day


def rec_plants(difficulty):
    strategy_query = f"rec_strategy({difficulty}, Plant)."
    strategy_result = list(janus.query(strategy_query))
    strategy_plants = [res['Plant'] for res in strategy_result]

    defeated_zombies = []
    for plant in strategy_plants:
        defeat_query = f"defeat({plant}, Zombie)."
        defeat_result = list(janus.query(defeat_query))
        defeated_zombies.extend(res['Zombie'] for res in defeat_result)

    return strategy_plants, defeated_zombies


def main(file: str):
    janus.consult(file)
    print("Добро пожаловать в систему рекомендаций растений против зомби!")

    plant_type, difficulty, time_of_day = input_pref()

    dif_map = {
        "легкий": "easy",
        "средний": "medium",
        "сложный": "hard"
    }

    dif_prolog = dif_map.get(difficulty)
    if dif_prolog is None:
        print("Неизвестный уровень сложности")
        return

    recom_plants, defeated_zombies = rec_plants(dif_prolog)

    if recom_plants:
        print(f"Рекомендуемые растения: {', '.join(recom_plants)}")
        print(f"Эти растения могут победить следующих зомби: {', '.join(set(defeated_zombies))}")
    else:
        print("Нет рекомендаций для ваших предпочтений")


if __name__ == "__main__":
    main("knowledge_base/lab2.pl")
