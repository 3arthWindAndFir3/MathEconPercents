{
* ��������� ��� �� ���������!
* ����� �������� ��� ��� ������� 4 ���� ��������, ����� ���������� ������ n
* � ����� �� ������
* ���� ��� ����������� ������ ���������� ������� % �� ����� ����� ��������
* 
* UPD1:
* ����� ��������� ������ ���� ������� �����
* ��� ��� ��������?
* ������ �� ��������� m ��� � ����
* ������ n ��� �������, ����� �������� ��������� ���� � ���� � ����
* ��������� ����� �����, ������� ������������� �������� � ��������� 
* ��������� � �������
* ��� ��� ������� + ���� ���������, ��������� �� ��������� �������?
* 
* UPD2:
* �������� ��� ��������� �� ������ ������ �������
* ��� ������� �����, ����� �� ��������, ������ � ������� ���������
* ������� ���������� ��������� ����� ������� �����������!
* ������ ���� ���������� ��� �� ���� �����������
* 
* UPD3:
* ��������� ��������� �� ������ ������, 
* �������� ����� �� 200. �������� ����� ���� ������ �� ������� �����,
* ������ ����� �����, ������� � ������ �� ��������� ��������� � �������
* }

program matheconpercents2.pas;	

uses math, windows;

var typeOfTask:string;
S,P,i,n,d,a,b: real;
outputResult:text;

{����������� � ����������}

procedure greetings;
begin
	writeln('������� ����� �� ��������� � ���������������');
	writeln('�� � ��������� �� ������� % �������');
	writeln('��� � ��������� �� ������� % �������, ����� �����');
	writeln('��� � ��������� �� ������� % �������, ��������� �����');
	writeln('��� � ��������������� �� ������� % �������, ��������������',
	' ���������������');
	writeln('��� � ��������������� �� ������� % �������, ���������� ����', 
	' ��������');
	writeln('��� � ��������������� �� ������� % �������, ��������������', 
	' ���������������');
	writeln('��� - ��������������� �� ������� % �������, ���������� ����', 
	' ��������');
end;
	
{����� ������ ���� ������}	
	
procedure askingUser(var anwser: string);
var enter:boolean;
begin
	writeln('������ ���� ������ ������ ������ ���������?');
	{$I-}
	readln(anwser);
	if IOResult <> 0 then begin
		while IOResult<>0 do begin
			writeln('�������� �����! ���������� ��� ���.');
			readln(anwser);
		end;
	end;
	{$I+}
	if (anwser='��') or (anwser='���') or (anwser='���') or (anwser='���')
	or (anwser='���') or (anwser='���') or (anwser='���') then begin
		enter:=true;
	end
	else begin
			enter:=false;
			while not enter do begin
				writeln('�������� �����! ���������� ��� ���.');
				readln(anwser);
			if (anwser='��') or (anwser='���') or (anwser='���') or
			(anwser='���') or (anwser='���') or (anwser='���')
			or (anwser='���') then begin
				enter:=true;
			end;
		end;
	end;
end;

{���� ������ ������ ��� ��������}

procedure inputRaising (var summ, percents, years:real);
begin
	writeln('-----------------------------');
	writeln('������� �������� P:');
	readln(summ);
	writeln('������� �������� i:');
	readln(percents);
	percents:=percents/100;
	writeln('������� �������� n:');
	readln(years);
end;

procedure inputDiscontMath (var result, percents, years:real);
begin
	writeln('-----------------------------');
	writeln('������� �������� S:');
	readln(result);
	writeln('������� �������� i:');
	readln(percents);
	percents:=percents/100;
	writeln('������� �������� n:');
	readln(years);
end;

procedure inputRaisingMixed (var summ, percents, years, days:real);
begin
	writeln('-----------------------------');
	writeln('������� �������� P:');
	readln(summ);
	writeln('������� �������� i');
	readln(percents);
	percents:=percents/100;
	writeln('������� �������� a');
	readln(years);
	writeln('������� �������� b');
	readln(days);
	days:=days/365;
end;

procedure inputDiscontBank (var result, percents, years:real);
begin
	writeln('-----------------------------');
	writeln('������� �������� S:');
	readln(result);
	writeln('������� �������� d');
	readln(percents);
	percents:=percents/100;
	writeln('������� �������� n');
	readln(years);
end;

{������ �� ��������}

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

{����� �� ����� � � ����}

procedure outputRaising;
begin
	{����� ��������� � ����}
	{$I-}
		assign(outputResult, 'output.txt');
		rewrite(outputResult);
		writeln(outputResult, 'P=',P:0:4, ' ������(�/�)');
		writeln(outputResult, 'n=',n:0:4, ' ���(�)/���');
		writeln(outputResult, 'i=',i*100:0:4, '%');
		writeln(outputResult, '-----------------------------');
		writeln(outputResult, 'S=?');
		writeln(outputResult, '-----------------------------');
		writeln(outputResult, 'S=',S:0:4);
		close(outputResult);
	{$I+}
	writeln('-----------------------------');
	writeln('S=',S:0:4, ' ������(�/�)');
	writeln('-----------------------------');
	writeln('���������� ������ ��������� ���� �������� � ���� output.txt');
end;

procedure outputDiscontMath;
begin
	{����� ��������������� � ����}
	{$I-}
		assign(outputResult, 'output.txt');
		rewrite(outputResult);
		writeln(outputResult, 'S=',S:0:4, ' ������(�/�)');
		writeln(outputResult, 'n=',n:0:4, ' ���(�)/���');
		writeln(outputResult, 'i=',i*100:0:4, '%');
		writeln(outputResult, '-----------------------------');
		writeln(outputResult, 'P=?');
		writeln(outputResult, '-----------------------------');
		writeln(outputResult, 'P=',P:0:4);
		close(outputResult);
	{$I+}
	writeln('-----------------------------');
	writeln('P=',P:0:4, ' ������(�/�)');
	writeln('-----------------------------');
	writeln('���������� ������ ��������� ���� �������� � ���� output.txt');
end;

procedure outputDiscontBank;
begin
	{����� ��������������� � ����}
	{$I-}
		assign(outputResult, 'output.txt');
		rewrite(outputResult);
		writeln(outputResult, 'S=',S:0:4, ' ������(�/�)');
		writeln(outputResult, 'n=',n:0:4, ' ���(�)/���');
		writeln(outputResult, 'd=',d*100:0:4, '%');
		writeln(outputResult, '-----------------------------');
		writeln(outputResult, 'P=?');
		writeln(outputResult, '-----------------------------');
		writeln(outputResult, 'P=',P:0:4);
		close(outputResult);
	{$I+}
	writeln('-----------------------------');
	writeln('P=',P:0:4, ' ������(�/�)');
	writeln('-----------------------------');
	writeln('���������� ������ ��������� ���� �������� � ���� output.txt');
end;

procedure outputRaisingMixed;
begin
	{����� ���������, ������������ ��������� �������}
	{$I-}
		assign(outputResult, 'output.txt');
		rewrite(outputResult);
		writeln(outputResult, 'P=',P:0:4, ' ������');
		writeln(outputResult, 'a=',a:0:2, ' ���');
		writeln(outputResult, 'b=',b*365:0:0, ' ����');
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
	writeln('���������� ������ ��������� ���� �������� � ���� output.txt');
end;
	
BEGIN
	setConsoleCP(1251);
	setConsoleOutputCP(1251);
	{������������ ������������}
	greetings;
	{���������� � �����, ������ ���� ������ ����� ������!}
	askingUser(typeOfTask);
	{� ����������� �� ������ �������� ���������, ������� ������� � �����
	* �������� ������, �������� �� �� ������ �������, � ����� ������� 
	* ���������� �� ����� � � ����}
	if (typeOfTask='��') then begin
		inputRaising(P, i, n);
		S:=raisingSimple(P,i,n);
		outputRaising;
	end;
	if (typeOfTask='���')then begin
		inputDiscontMath(S, i, n);
		P:=discontSimpleMath(S,i,n);
		outputDiscontMath;
	end;
	if (typeOfTask='���') then begin
		inputDiscontBank(S,d,n); 
		P:=discontSimpleBank(S,d,n);
		outputDiscontBank;
	end;
	if (typeOfTask='���') then begin 
		inputRaising(P, i, n);
		S:=raisingCommon(P,i,n);
		outputRaising;
	end;
	if (typeOfTask='���') then begin
		inputRaisingMixed(P, i, a, b);
		S:=raisingMixed(P,i,a,b);
		outputRaisingMixed; 
	end;
	if (typeOfTask='���') then begin
		inputDiscontMath(S, i, n); 
		P:=discontCompoundMath(S,i,n);
		outputDiscontMath;
	end;
	if (typeOfTask='���') then begin
		inputDiscontBank(S,d,n); 
		P:=discontCompoundBank(S,d,n);
		outputDiscontBank;
	end;
END.
