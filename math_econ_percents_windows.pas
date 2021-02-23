{
* ПРОГРАММА ЕЩЕ НЕ ЗАКОНЧЕНА!
* нужно доделать еще как минимум 4 типа расчетов, затем прикрутить расчет n
* и всего по мелочи
* пока что реализовано только нахождение простых % по обеим типам операций
* 
* UPD1:
* вроде прикрутил расчет всех базовых типов
* что еще осталось?
* расчет по наращению m раз в году
* расчет n при условии, когда известна временная база и срок в днях
* упростить текст проги, запулив повторяющиеся элементы в отдельные 
* процедуры и функции
* все еще впереди + надо проверить, правильно ли программа считает?
* 
* UPD2:
* проверил все имеющиеся на данный момент функции
* все считает верно, точно по формулам, сверял с ручными расчетами
* базовый функционал программы можно считать завершенным!
* дальше буду допиливать все по мере возможности
* 
* UPD3:
* переписал программу на основе старой, 
* сократил строк на 200. Упростил выбор типа задачи со стороны юзера,
* разбил этапы ввода, расчета и вывода на различные процедуры и функции
* }

program matheconpercents2.pas;	

uses math, windows;

var typeOfTask:string;
S,P,i,n,d,a,b: real;
outputResult:text;

{ПРИВЕТСТВИЕ И ИНСТРУКЦИИ}

procedure greetings;
begin
	writeln('Решение задач на наращение и дисконтирование');
	writeln('пн — наращение по простым % ставкам');
	writeln('сно — наращение по сложным % ставкам, общий метод');
	writeln('снс — наращение по сложным % ставкам, смешанный метод');
	writeln('пдм — дисконтирование по сложным % ставкам, математическое',
	' дисконтирование');
	writeln('пдб — дисконтирование по сложным % ставкам, банковский учет', 
	' векселей');
	writeln('сдм — дисконтирование по сложным % ставкам, математическое', 
	' дисконтирование');
	writeln('сдб - дисконтирование по сложным % ставкам, банковский учет', 
	' векселей');
end;
	
{ВЫБОР ЮЗЕРОМ ТИПА ЗАДАЧИ}	
	
procedure askingUser(var anwser: string);
var enter:boolean;
begin
	writeln('Какого типа задачу должна решить программа?');
	{$I-}
	readln(anwser);
	if IOResult <> 0 then begin
		while IOResult<>0 do begin
			writeln('Неверный ответ! Попробуйте еще раз.');
			readln(anwser);
		end;
	end;
	{$I+}
	if (anwser='пн') or (anwser='сно') or (anwser='снс') or (anwser='пдм')
	or (anwser='пдб') or (anwser='сдм') or (anwser='сдб') then begin
		enter:=true;
	end
	else begin
			enter:=false;
			while not enter do begin
				writeln('Неверный ответ! Попробуйте еще раз.');
				readln(anwser);
			if (anwser='пн') or (anwser='сно') or (anwser='снс') or
			(anwser='пдм') or (anwser='пдб') or (anwser='сдм')
			or (anwser='сдб') then begin
				enter:=true;
			end;
		end;
	end;
end;

{ВВОД ЮЗЕРОМ ДАННЫХ ДЛЯ РАСЧЕТОВ}

procedure inputRaising (var summ, percents, years:real);
begin
	writeln('-----------------------------');
	writeln('Введите значение P:');
	readln(summ);
	writeln('Введите значение i:');
	readln(percents);
	percents:=percents/100;
	writeln('Введите значение n:');
	readln(years);
end;

procedure inputDiscontMath (var result, percents, years:real);
begin
	writeln('-----------------------------');
	writeln('Введите значение S:');
	readln(result);
	writeln('Введите значение i:');
	readln(percents);
	percents:=percents/100;
	writeln('Введите значение n:');
	readln(years);
end;

procedure inputRaisingMixed (var summ, percents, years, days:real);
begin
	writeln('-----------------------------');
	writeln('Введите значение P:');
	readln(summ);
	writeln('Введите значение i');
	readln(percents);
	percents:=percents/100;
	writeln('Введите значение a');
	readln(years);
	writeln('Введите значение b');
	readln(days);
	days:=days/365;
end;

procedure inputDiscontBank (var result, percents, years:real);
begin
	writeln('-----------------------------');
	writeln('Введите значение S:');
	readln(result);
	writeln('Введите значение d');
	readln(percents);
	percents:=percents/100;
	writeln('Введите значение n');
	readln(years);
end;

{РАСЧЕТ ПО ФОРМУЛАМ}

function raisingSimple(summ, percents, years:real):real;
begin
	raisingSimple:=summ*(1+percents*years);
end;

function discontSimpleMath (result, percents, years:real):real;
begin
	discontSimpleMath:=result/(1+percents*years);
end;

function discontSimpleBank (result,percents,years:real):real;
begin
	discontSimpleBank:=result*(1-percents*years);
end;

function raisingCommon (summ, percents, years:real):real;	
begin
	raisingCommon:=summ*power((1+percents),years);
end;

function raisingMixed(summ, percents, years, days:real):real;
begin
	raisingMixed:=summ*power((1+percents),years)*(1+percents*days);
end;

function discontCompoundMath(result, percents,years:real):real;
begin
	discontCompoundMath:=result/(power(1+percents,years));
end;

function discontCompoundBank(result, percents,years:real):real;
begin
	discontCompoundBank:=result*(power(1-percents,years));
end;

{ВЫВОД НА ЭКРАН И В ФАЙЛ}

procedure outputRaising;
begin
	{вывод наращения в файл}
	{$I-}
		assign(outputResult, 'output.txt');
		rewrite(outputResult);
		writeln(outputResult, 'P=',P:0:4, ' рублей(ь/я)');
		writeln(outputResult, 'n=',n:0:4, ' год(а)/лет');
		writeln(outputResult, 'i=',i*100:0:4, '%');
		writeln(outputResult, '-----------------------------');
		writeln(outputResult, 'S=?');
		writeln(outputResult, '-----------------------------');
		writeln(outputResult, 'S=',S:0:4);
		close(outputResult);
	{$I+}
	writeln('-----------------------------');
	writeln('S=',S:0:4, ' рублей(ь/я)');
	writeln('-----------------------------');
	writeln('Результаты работы программы были занесены в файл output.txt');
end;

procedure outputDiscontMath;
begin
	{вывод дисконтирования в файл}
	{$I-}
		assign(outputResult, 'output.txt');
		rewrite(outputResult);
		writeln(outputResult, 'S=',S:0:4, ' рублей(ь/я)');
		writeln(outputResult, 'n=',n:0:4, ' год(а)/лет');
		writeln(outputResult, 'i=',i*100:0:4, '%');
		writeln(outputResult, '-----------------------------');
		writeln(outputResult, 'P=?');
		writeln(outputResult, '-----------------------------');
		writeln(outputResult, 'P=',P:0:4);
		close(outputResult);
	{$I+}
	writeln('-----------------------------');
	writeln('P=',P:0:4, ' рублей(ь/я)');
	writeln('-----------------------------');
	writeln('Результаты работы программы были занесены в файл output.txt');
end;

procedure outputDiscontBank;
begin
	{вывод дисконтирования в файл}
	{$I-}
		assign(outputResult, 'output.txt');
		rewrite(outputResult);
		writeln(outputResult, 'S=',S:0:4, ' рублей(ь/я)');
		writeln(outputResult, 'n=',n:0:4, ' год(а)/лет');
		writeln(outputResult, 'd=',d*100:0:4, '%');
		writeln(outputResult, '-----------------------------');
		writeln(outputResult, 'P=?');
		writeln(outputResult, '-----------------------------');
		writeln(outputResult, 'P=',P:0:4);
		close(outputResult);
	{$I+}
	writeln('-----------------------------');
	writeln('P=',P:0:4, ' рублей(ь/я)');
	writeln('-----------------------------');
	writeln('Результаты работы программы были занесены в файл output.txt');
end;

procedure outputRaisingMixed;
begin
	{вывод наращения, выполненного смещанным методом}
	{$I-}
		assign(outputResult, 'output.txt');
		rewrite(outputResult);
		writeln(outputResult, 'P=',P:0:4, ' рублей');
		writeln(outputResult, 'a=',a:0:2, ' лет');
		writeln(outputResult, 'b=',b*365:0:0, ' дней');
		writeln(outputResult, 'i=',i*100:0:4, '%');
		writeln(outputResult, '-----------------------------');
		writeln(outputResult, 'S=?');
		writeln(outputResult, '-----------------------------');
		writeln(outputResult, 'S=',S:0:4);
		close(outputResult);
	{$I+}
	writeln('-----------------------------');
	writeln('S=',S:0:4);
	writeln('-----------------------------');
	writeln('Результаты работы программы были занесены в файл output.txt');
end;
	
BEGIN
	setConsoleCP(1251);
	setConsoleOutputCP(1251);
	{приветствуем пользователя}
	greetings;
	{спрашиваем у юзера, какого типа задачу нужно решить!}
	askingUser(typeOfTask);
	{в зависимости от выбора вызываем процедуры, которые спросят у юзера
	* исходные данные, выполнят на их основе расчеты, а потом выведут 
	* результаты на экран и в файл}
	if (typeOfTask='пн') then begin
		inputRaising(P, i, n);
		S:=raisingSimple(P,i,n);
		outputRaising;
	end;
	if (typeOfTask='пдм')then begin
		inputDiscontMath(S, i, n);
		P:=discontSimpleMath(S,i,n);
		outputDiscontMath;
	end;
	if (typeOfTask='пдб') then begin
		inputDiscontBank(S,d,n); 
		P:=discontSimpleBank(S,d,n);
		outputDiscontBank;
	end;
	if (typeOfTask='сно') then begin 
		inputRaising(P, i, n);
		S:=raisingCommon(P,i,n);
		outputRaising;
	end;
	if (typeOfTask='снс') then begin
		inputRaisingMixed(P, i, a, b);
		S:=raisingMixed(P,i,a,b);
		outputRaisingMixed; 
	end;
	if (typeOfTask='сдм') then begin
		inputDiscontMath(S, i, n); 
		P:=discontCompoundMath(S,i,n);
		outputDiscontMath;
	end;
	if (typeOfTask='сдб') then begin
		inputDiscontBank(S,d,n); 
		P:=discontCompoundBank(S,d,n);
		outputDiscontBank;
	end;
END.
