Процедура Тест()

    // Такое объявление ловим
    ОписаниеОповещения1 = Новый ОписаниеОповещения(
        "ОбработчикОписаниеОповещения",
        ЭтотОбъект,
        ,
        "ОшибкаОписаниеОповещения",
        ЭтотОбъект
    );

    // Такое объявление не ловим
    ОписаниеОповещения2 = Новый ОписаниеОповещения(
        "ОбработчикОписаниеОповещения",
        ОбщийМодуль("Имя"),
        ,
        "ОшибкаОписаниеОповещения",
        ОбщегоНазначения.ОбщийМодуль("Имя")
    );

    // Такое объявление не ловим
    ОписаниеОповещения3 = Новый ОписаниеОповещения(
        "ОбработчикОписаниеОповещения",
        "ИмяМодуля",
        ,
        "ОшибкаОписаниеОповещения",
        "ДругоеИмяМодуля"
    );

    // Такое объявление не ловим
    ОбработчикОписаниеОповещения = "ОбработчикОписаниеОповещенияВПеременной";
    ОшибкаОписаниеОповещения = "ОшибкаОписаниеОповещенияВПеременной";
    ОписаниеОповещения4 = Новый ОписаниеОповещения(
        ОбработчикОписаниеОповещения,
        ЭтотОбъект,
        ,
        ОшибкаОписаниеОповещения,
        ЭтотОбъект
    );

    // Такое объявление не ловим
    ПараметрыОбработчика = Новый Массив(5);
    ПараметрыОбработчика[0] = "ОбработатьОповещение";
    ПараметрыОбработчика[1] = ЭтотОбъект;
    ПараметрыОбработчика[3] = "ОшибкаОписаниеОповещения";
    ПараметрыОбработчика[4] = ЭтотОбъект;
    ОписаниеОповещения5 = Новый("ОписаниеОповещения", ПараметрыОбработчика);

КонецПроцедуры

Процедура ОбработчикОписаниеОповещения(Ответ, ДопПараметры) Экспорт

    // Тут какой-то код

КонецПроцедуры

Процедура ОшибкаОписаниеОповещения(Ответ, ДопПараметры) Экспорт

    // Тут какой-то код

КонецПроцедуры

Процедура ОбработчикОписаниеОповещенияВПеременной(Ответ, ДопПараметры) Экспорт

    // Тут какой-то код

КонецПроцедуры

Процедура ОшибкаОписаниеОповещенияВПеременной(Ответ, ДопПараметры) Экспорт

    // Тут какой-то код

КонецПроцедуры