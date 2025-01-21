return {
	-- config errors
	["error-template"] = "$red$Ошибка$reset$: $error$",
	["config-unsupported-key"] = "ключ `$key$` использует неподдерживаемый тип данных $type$ (используйте число или строку)!",
	["config-unsupported-value"] = "значение `$value$` использует неподдерживаемый тип данных $type$ (используйте число или строку)!",
	-- invalid aliases
	["error-invalid-alias-key"] = "некорректный ключ псевдонима `$key$` со значением `$value$!",
	["error-invalid-alias-value"] = "некорректное значение псевдонима `$value$` с ключом `$key$`!",
	["error-invalid-alias-string-type"] = "Ключ и значение должны быть строками!",
	-- overlapping licenses
	["warning-template"] = "$yellow$Предупреждение$reset$: $warning$",
	["warning-overlapping-licenses"] = "так как названия лицензий не чувствительны к регистру, эти $type$ лицензии конфликтуют друг с другом: $first$ и $second",
	["license-type-custom"] = "пользовательские",
	["license-type-standard"] = "стандартные",
	-- license list
	["license-list-custom-licenses"] = "Пользовательские лиценизз:",
	["license-list-overwrites"] = "$license$ (переопределяет стандартную лицензию)",
	["license-list-overwritten"] = "$license$ (переопределена пользовательской лицензией)",
	["license-list-standard-licenses"] = "Стандартные лицензии:",
	-- help
	["cli-help"] = [==[Небольшая утилита для генерации файлов лицензий по шаблону
ИСПОЛЬЗОВАНИЕ:

	licensegen [ОПЦИИ] [ЛИЦЕНЗИЯ] [АРГУМЕНТЫ]

ОПЦИИ:

	-h,     --help        Показывает эту страницу с документацией
	-v,     --version     Показывает текущую версию программы
	-a,     --aliases     Показывает псевдонимы лицензий
	-i,     --info        Показывает подробную информацию о выбранной лицензии
	--list, --licenses    Показывает все лицензии
	--cfg,  --config      Показывает путь до файла конфигурации

АРГУМЕНТЫ:

Аргументы замены текста должны быть заданы в следующем формате: `--<аргумент>=<текст>`, например `--owner=пользователь` или `--owner="Ваше полное имя"`. Все аргументы (с некоторыми исключениями) можно задать в файле конфигурации или переназначить при помощи аргумента в консоли.

Некоторые аргументы могут задаваться самостоятельно:
	aliases       Задаёт псевдонимы для лицензий (Lua-таблица, используйте `--aliases` чтобы увидеть весь список)
	filename      Название создаваемого файла (по-умолчанию `LICENSE`)
	licensename   Название лицензии, которую вы хотите использовать (переменную можно задать только в файле конфигурации)
	owner         Владелец проекта (по-умолчанию имя пользователя этого компьютера)
	project       Название проекта (по-умолчанию название текущей директории)
	workdir       Полный путь до проекта, в котором будет создаваться файл
	year          Текущий год

Список аргументов, которые нельзя поменять:]==],
	["cli-help-cfg-only"] = "Эти аргументы можно задать только в файле конфигурации:",
	["cli-aliases"] = "Список всех псевдонимов разных лицензий. Вы можете задать свои собственные псевдонимы или перезаписать существующие в конфигурационном файле:",
	-- config path
	["cli-config-directory"] = [==[Полный путь до директории с конфигурацией: $dir$$slash$
Конфигурационный файл: $dir$$slash$config.lua
Директория с пользовательскими лицензиями: $dir$$slash$licenses$slash$]==],
	["error-unknown-license"] = "неизвестная лицензия `$name$`. Возможно вы искали другую лицензию с похожим названием:",
	["error-no-license-name"] = "не было предоставлено название лицензии!",
	["warning-unfilled-argument"] = "аргумент `$arg$` не был заменён!",
	["error-open-file"] = "во время открытия файла `$path$` произошла ошибка!",
	-- note formatting
	["note-format"] = "$blue$Примечание$reset$: $note$",
	-- done
	["done"] = "$green$ГОТОВО!$reset$",
	-- notes
	["note-agpl-3.0"] = "Free Software Foundation рекомендует как дополнительный шаг добавить короткий шаблон лицензии на верх каждого файла. Шаблон можно найти внизу этой лицензии.",
	["note-apache-2.0"] = "Apache Software Foundation рекомендует как дополнительный шаг добавить короткий шаблон лицензии на верх каждого файла. Шаблон можно найти внизу этой лицензии. Более подробную информацию можно прочитать здесь: https://apache.org/foundation/license-faq.html#Apply-My-Software",
	["note-bsl-1.0"] = "Boost рекомендует как дополнительный шаг добавить короткий шаблон лицензии на верх каждого файла. Шаблон можно найти на странице Boost Software License FAQ: https://www.boost.org/users/license.html#FAQ",
	["note-cc0-1.0"] = "Creative Commons рекомендует как дополнительный шаг добавить короткий шаблон лицензии на верх каждого файла. Шаблон можно найти на их сайте: https://wiki.creativecommons.org/wiki/CC0_FAQ#May_I_apply_CC0_to_computer_software.3F_If_so.2C_is_there_a_recommended_implementation.3F",
	-- ["note-cern-ohl-p-2.0"] = "CERN recommends adding the following information in the source files: copyright and license notice, a disclaimer of warranties and a source location. You can also include the source location in a part of the design which will be visible in the end product: https://ohwr.org/project/cernohl/wikis/uploads/8a6b5d01f71c207c49493e4d114d61e6/cern_ohl_p_v2_howto.pdf",
	-- ["note-cern-ohl-s-2.0"] = "CERN recommends adding the following information in the source files: copyright and license notice, a disclaimer of warranties and a source location. You can also include the source location in a part of the design which will be visible in the end product: https://ohwr.org/project/cernohl/wikis/uploads/cf37727497ca2b5295a7ab83a40fcf5a/cern_ohl_s_v2_user_guide.pdf",
	-- ["note-cern-ohl-w-2.0"] = "CERN recommends adding the following information in the source files: copyright and license notice, a disclaimer of warranties and a source location. You can also include the source location in a part of the design which will be visible in the end product: https://ohwr.org/project/cernohl/wikis/uploads/c2e5e9d297949b5c2d324a6cbf6adda0/cern_ohl_w_v2_howto.pdf",
	["note-ecl-2.0"] = "Apereo Foundation рекомендует как дополнительный шаг добавить короткий шаблон лицензии на верх каждого файла. Шаблон можно найти внизу этой лицензии.",
	["note-eupl-1.1"] = "Европейская комиссия рекомендует как дополнительный шаг добавить короткий шаблон лицензии на верх каждого файла: https://joinup.ec.europa.eu/sites/default/files/inline-files/EUPL%201_1%20Guidelines%20EN%20Joinup.pdf#page=17",
	["note-gfdl-1.3"] = "Free Software Foundation рекомендует как дополнительный шаг добавить короткий шаблон лицензии на верх каждого файла. Шаблон можно найти в аддендуме этой лицензии.",
	["note-gpl-2.0"] = "Free Software Foundation рекомендует как дополнительный шаг добавить короткий шаблон лицензии на верх каждого файла. Шаблон можно найти внизу этой лицензии.",
	["note-gpl-3.0"] = "Free Software Foundation рекомендует как дополнительный шаг добавить короткий шаблон лицензии на верх каждого файла. Шаблон можно найти внизу этой лицензии.",
	["note-lgpl-2.1"] = "Free Software Foundation рекомендует как дополнительный шаг добавить короткий шаблон лицензии на верх каждого файла. Шаблон можно найти внизу этой лицензии.",
	["note-lgpl-3.0"] = "Free Software Foundation рекомендует как дополнительный шаг добавить короткий шаблон лицензии на верх каждого файла. Шаблон можно найти внизу этой лицензии.",
	["note-lpp-1.3c"] = "Пример шаблона и больше информации об использовании лицензии можно найти внизу.",
	["note-mpl-2.0"] = "Mozilla Foundation рекомендует как дополнительный шаг добавить короткий шаблон лицензии на верх каждого файла. Шаблон можно найти внизу этой лицензии (секция Exhibit A).",
	["note-mulanpsl-2.0"] = "Рекомендуется добавить короткий шаблон лицензии на верх каждого файла. Шаблон можно найти внизу этой лицензии.",
	["note-ofl-1.1"] = "Эта лицензия не обязывает давать доступ к исходникам, но рекомендует это делать. Все производные файлы от файлов под лицензией OFl обязаны оставаться под этой же лицензией.",
	["note-upl-1.0"] = "Рекомендуется добавить ссылку на информацию о лицензии и авторском праве на верх каождого исходного файла, пример можно найти тут: https://oss.oracle.com/licenses/upl/",
}
