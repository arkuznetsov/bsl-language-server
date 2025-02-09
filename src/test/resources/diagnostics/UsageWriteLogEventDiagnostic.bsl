&НаСервере
Процедура Тест1()

    ЗаписьЖурналаРегистрации("Событие");// ошибка
    ЗаписьЖурналаРегистрации("Событие", УровеньЖурналаРегистрации.Ошибка);// ошибка
    ЗаписьЖурналаРегистрации("Событие", УровеньЖурналаРегистрации.Ошибка, , );// ошибка

    ЗаписьЖурналаРегистрации("Событие",
      , // ошибка
      , , ПодробноеПредставлениеОшибки(ИнформацияОбОшибке()));

    ЗаписьЖурналаРегистрации("Событие", УровеньЖурналаРегистрации.Ошибка, , , );// ошибка

    Попытка
      ПравильноеИсключениеВКодеСервер();
    Исключение
      ЗаписьЖурналаРегистрации("Событие", УровеньЖурналаРегистрации.Ошибка, , ,
        ОписаниеОшибки()); // ошибка
    КонецПопытки;

    Попытка
      ПравильноеИсключениеВКодеСервер();
    Исключение
      ЗаписьЖурналаРегистрации("Событие", УровеньЖурналаРегистрации.Ошибка, , ,
        "Комментарий 1"); // ошибка
    КонецПопытки;

    Попытка
      ПравильноеИсключениеВКодеСервер();
    Исключение
      ТекстОшибки = "Описание" + Метод();
      ЗаписьЖурналаРегистрации("Событие", УровеньЖурналаРегистрации.Ошибка, , ,
        "Еще текст " + ТекстОшибки + Метод()); // ошибка
    КонецПопытки;

    Попытка
      ПравильноеИсключениеВКодеСервер();
    Исключение
      ЗаписьЖурналаРегистрации("Событие", УровеньЖурналаРегистрации.Ошибка, , ,
        "Еще текст " + НетПрисвоения); // ошибка
    КонецПопытки;

    Попытка
      ПравильноеИсключениеВКодеСервер();
    Исключение
      ЗаписьЖурналаРегистрации("Событие", УровеньЖурналаРегистрации.Предупреждение, , , // ошибка
        "Еще текст ");
    КонецПопытки;

    Попытка
      ПравильноеИсключениеВКодеСервер();
    Исключение
      ЗаписьЖурналаРегистрации("Событие", УровеньЖР, , ,
        ПодробноеПредставлениеОшибки(ИнформацияОбОшибке()));
    КонецПопытки;

    Попытка
      ПравильноеИсключениеВКодеСервер();
    Исключение // не проверяем
    КонецПопытки;
КонецПроцедуры

&НаКлиенте
Процедура НеверноеИсключениеВКодеКлиент()
  Попытка
      Тест1();
  Исключение
      ПоказатьПредупреждение(,НСтр("ru = 'Операция не может быть выполнена.'")); // ошибка
  КонецПопытки;
КонецПроцедуры

&НаСервере
Процедура РазрешенныеВызовы()

  ЗаписьЖурналаРегистрации("Событие",
    УровеньЖурналаРегистрации.Ошибка, , ,
    ПодробноеПредставлениеОшибки(ИнформацияОбОшибке()));

  ЗаписьЖурналаРегистрации(НСтр("ru = 'Мой механизм.Действие с возможной ошибкой'", КодОсновногоЯзыка),
    УровеньЖурналаРегистрации.Ошибка, , ,
    НСтр("ru = 'Во время выполнения действия произошла неизвестная ошибка.'") + Символы.ПС +
    ПодробноеПредставлениеОшибки(ИнформацияОбОшибке()));

    Попытка
      ПравильноеИсключениеВКодеСервер();
    Исключение
      ВызватьИсключение;
    КонецПопытки;

    Попытка
      ПравильноеИсключениеВКодеСервер();
    Исключение
      ЗаписьЖурналаРегистрации("Событие",
        УровеньЖурналаРегистрации.Ошибка, , ,
        ОписаниеОшибки());

      ВызватьИсключение;
    КонецПопытки;

    Попытка
      ПравильноеИсключениеВКодеСервер();
    Исключение

      ТекстОшибки = ПодробноеПредставлениеОшибки(ИнформацияОбОшибке());
      ЗаписьЖурналаРегистрации("Событие", УровеньЖурналаРегистрации.Ошибка, , ,
         ТекстОшибки);
    КонецПопытки;

    ЗаписьЖурналаРегистрации("Событие",
                УровеньЖурналаРегистрации.Ошибка, , ,
                "ТекстОшибки"); // нет ошибки, т.к. блок вне Попытки

    ТекстОшибки = "Текст";
    ЗаписьЖурналаРегистрации("Событие",
                УровеньЖурналаРегистрации.Ошибка, , ,
                ТекстОшибки); // нет ошибки, т.к. блок вне Попытки

	Если Условие() Тогда
		Описание = СтрШаблон("В системе не зарегистрировано обработчиков сообщений для очереди %1", ИмяОчереди);
		ЗаписьЖурналаРегистрации("ПолучениеСообщений.Настройка", УровеньЖурналаРегистрации.Предупреждение, , ,
				Описание);
		Возврат;
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура ПравильноеИсключениеВКодеКлиент()
  Попытка
    ИсключениеВКодеСервер();
  Исключение
      ТекстСообщения = КраткоеПредставлениеОшибки(ИнформацияОбОшибке());
      ПоказатьПредупреждение(,НСтр("ru = 'Операция не может быть выполнена по причине:'") + Символы.ПС + ТекстСообщения);
  КонецПопытки;
КонецПроцедуры

&НаСервере
Процедура ПравильноеИсключениеВКодеСервер()
  Попытка
    // код, приводящий к вызову исключения
    А = 10;
  Исключение
    // Запись события в журнал регистрации для системного администратора.
    ЗаписьЖурналаРегистрации(НСтр("ru = 'Выполнение операции'"),
       УровеньЖурналаРегистрации.Ошибка,,,
       ПодробноеПредставлениеОшибки(ИнформацияОбОшибке()));
    ВызватьИсключение;
  КонецПопытки;
КонецПроцедуры

&НаКлиенте
Процедура ПравильноСоздатьФайлНаДиске()
  Попытка
      // клиентский код, приводящий к вызову исключения
      СоздатьФайлНаДиске();
  Исключение
      ТекстСообщения = КраткоеПредставлениеОшибки(ИнформацияОбОшибке());
      ПоказатьПредупреждение(,НСтр("ru = 'Операция не может быть выполнена по причине:'") + Символы.ПС + ТекстСообщения);
      ЗаписатьОшибкуРаботыСФайлами(ПодробноеПредставлениеОшибки(ИнформацияОбОшибке()));
  КонецПопытки;
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ПравильноЗаписатьОшибкуРаботыСФайлами(Знач ПодробноеПредставлениеОшибки)
    ЗаписьЖурналаРегистрации(НСтр("ru = 'Выполнение операции'"),
       УровеньЖурналаРегистрации.Ошибка,,,
       ПодробноеПредставлениеОшибки); // не ошибка
КонецПроцедуры

&НаСервере
Процедура ПеременнаяОпределенаВБлокеВыше()
  ТекстОшибки = "";
  Попытка
    // код, приводящий к вызову исключения
    А = 10;
  Исключение
    // Запись события в журнал регистрации для системного администратора.
    ЗаписьЖурналаРегистрации(НСтр("ru = 'Выполнение операции'"),
       УровеньЖурналаРегистрации.Ошибка,,,
       ТекстОшибки);
  КонецПопытки;
КонецПроцедуры

&НаКлиенте
Процедура ВИсключенииЕстьКраткоеПредставлениеНоНетПолного()
  Попытка
      // клиентский код, приводящий к вызову исключения
      СоздатьФайлНаДиске();
  Исключение
      ПоказатьПредупреждение(,НСтр("ru = 'Операция не может быть выполнена по причине:'") + Символы.ПС + ТекстСообщения);
      ЗаписьЖурналаРегистрации(НСтр("ru = 'Выполнение операции'"),
       УровеньЖурналаРегистрации.Ошибка,,,
       КраткоеПредставлениеОшибки(ИнформацияОбОшибке())); // ошибка
  КонецПопытки;
КонецПроцедуры

&НаКлиенте
Процедура ВИсключенииЕстьКраткоеПредставлениеНоНетПолного1()
  Попытка
      // клиентский код, приводящий к вызову исключения
      СоздатьФайлНаДиске();
  Исключение
      ТекстСообщения = КраткоеПредставлениеОшибки(ИнформацияОбОшибке());
      ПоказатьПредупреждение(,НСтр("ru = 'Операция не может быть выполнена по причине:'") + Символы.ПС + ТекстСообщения);
      ЗаписьЖурналаРегистрации(НСтр("ru = 'Выполнение операции'"),
       УровеньЖурналаРегистрации.Ошибка,,,
       ТекстСообщения); // ошибка
  КонецПопытки;
КонецПроцедуры

&НаКлиенте
Процедура ВИсключенииЕстьКраткоеПредставлениеНоНетПолного2()
  Попытка
      // клиентский код, приводящий к вызову исключения
      СоздатьФайлНаДиске();
  Исключение
      ТекстСообщения = КраткоеПредставлениеОшибки(ИнформацияОбОшибке());
      ДругойТекстСообщения = ПодробноеПредставлениеОшибки(ИнформацияОбОшибке());
      ПоказатьПредупреждение(,НСтр("ru = 'Операция не может быть выполнена по причине:'") + Символы.ПС + ТекстСообщения);
      ЗаписьЖурналаРегистрации(НСтр("ru = 'Выполнение операции'"),
       УровеньЖурналаРегистрации.Ошибка,,,
       ТекстСообщения); // ошибка
  КонецПопытки;
КонецПроцедуры

Процедура ОбычнаяЗаписьВЖР(Знач ИмяСобытия, Знач ОписаниеОшибки, Знач Ответ, Знач СсылкаНаДанные = Неопределено) Экспорт
	ТекстЗаписи = ТекстОтвета(ОписаниеОшибки, Ответ);

	ЗаписьЖурналаРегистрации(
		ИмяСобытия,
		УровеньЖурналаРегистрации.Ошибка,
		,
		СсылкаНаДанные,
		ТекстЗаписи); // не ошибка
КонецПроцедуры

Процедура СложныйМетодСИспользованиемПодробногоПредставленияВнутриИсключения(Знач ИмяСобытия, Знач ОписаниеОшибки, Знач Ответ, Знач СсылкаНаДанные = Неопределено) Экспорт
		Попытка
			Блокировка.Заблокировать();
		Исключение
            ТекстСообщения = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(
                НСтр("ru = 'Не удалось обработать график работы по причине:
                      |%2'"),
                ПодробноеПредставлениеОшибки(ИнформацияОбОшибке()));

            ЗаписьЖурналаРегистрации(
                ИмяСобытия,
                УровеньЖурналаРегистрации.Ошибка,
                ,
                СсылкаНаДанные,
                ТекстСообщения); // не ошибка
		КонецПопытки;
КонецПроцедуры

Процедура СложныйМетодСИспользованиемПодробногоПредставленияВнутриИсключенияВВыражении(Знач Выборка, Знач Блокировка) Экспорт
		Попытка
			Блокировка.Заблокировать();
		Исключение
            ТекстСообщения =
                НСтр("ru = 'Не удалось установить разделение сеанса. Область данных'") + " = "
                    + Формат(Выборка.ОбластьДанных, "ЧГ=0")
                    + Символы.ПС + ПодробноеПредставлениеОшибки(ИнформацияОбОшибке());

            ЗаписьЖурналаРегистрации(
                ИмяСобытия,
                УровеньЖурналаРегистрации.Ошибка,
                ,
                СсылкаНаДанные,
                ТекстСообщения); // не ошибка

            ЗаписьЖурналаРегистрации(
                ИмяСобытия,
                УровеньОшибки(),
                ,
                СсылкаНаДанные,
                ТекстСообщения); // не ошибка

		КонецПопытки;
КонецПроцедуры

Процедура Метод2(Знач СсылкаНаДанные, Знач Блокировка)
		Попытка
			Блокировка.Заблокировать();
		Исключение
            КороткийТекстСообщения = КраткоеПредставлениеОшибки(ИнформацияОбОшибке()) + ОписаниеОшибки();

            ЗаписьЖурналаРегистрации(
                ИмяСобытия,
                УровеньЖурналаРегистрации.Ошибка,
                ,
                СсылкаНаДанные,
                КороткийТекстСообщения); // ошибка
		КонецПопытки;
КонецПроцедуры
