Unit Unit_Validacion;

{$MODE OBJFPC}

interface

uses crt,sysutils,dos,Unit_Sonido,Unit_Interfaz,Unit_Archivos;

procedure ValidacionFecha(var Fecha:String; Var AuxY:Integer; var AuxX:integer);
Procedure ValidacionEnteros(var DatoEntrada:integer; Var AuxY:Integer; var AuxX:integer);
Procedure ValidacionEnteros2(var DatoEntrada:integer;Var AuxY:Integer; var AuxX:integer);
Procedure ValidacionReales(var DatoEntrada:real; Var AuxY:Integer; var AuxX:integer);
Procedure ValidacionHora(var DatoEntrada:string; Var AuxY:Integer; Var AuxX:Integer);
Procedure ValidacionDNI(var DatoEntrada:integer; Var AuxY:Integer; var AuxX:integer);
//Procedure ValidacionCuil(var DatoEntrada:string);
Procedure Validacion_ID_LA(var A_LA:ArchivoLineaAerea; var ID:string; var R_LA:TipoLineaAerea);
Procedure Validacion_ID_A(var A_Aero:ArchivoAeropuerto; var ID:string; var R_Aero:TipoAeropuerto);
Procedure DesfaceVertical(var AuxY:Integer);



implementation

procedure ValidacionFecha(var Fecha:string; Var AuxY:Integer; var AuxX:integer);

var AnioPC,MesPC,DiaPC,CaseDia:word;
	AuxA,AuxM,AuxD:LongInt;

Begin
(AnioPC):=(0);
(MesPC):=(0);
(DiaPC):=(0);
(CaseDia):=(0);
(AuxA):=(0);
(AuxM):=(1);
(AuxD):=(1);
GetDate(AnioPC,MesPC,DiaPC,CaseDia);
gotoxy(AuxX,AuxY);
Write('Ingrese el anio: ');
AuxX:=(AuxX+17);
ValidacionEnteros2(AuxA,AuxY,AuxX);
AuxX:=(15);
Inc(AuxY);
DesfaceVertical(AuxY);
while (AuxA<AnioPC) do
	begin
	TextColor(12);
	gotoxy(AuxX,AuxY);
	writeln('El anio ingresado no puede ser anterior al anio actual.');
	Inc(AuxY);
	textcolor(15);
	gotoxy(AuxX,AuxY);
	Write('Vuelva a ingresar el anio: ');
	SonidoError4();
	AuxX:=(AuxX+27);
	ValidacionEnteros2(AuxA,AuxY,AuxX);
	AuxX:=(15);
	Inc(AuxY);
	DesfaceVertical(AuxY); //Solo se pone donde hay repeticion.
	end;
Gotoxy(AuxX,AuxY);	
Write('Ingrese el mes: ');
AuxX:=(AuxX+16);
ValidacionEnteros2(AuxM,AuxY,AuxX);
AuxX:=(15);
Inc(AuxY);
DesfaceVertical(AuxY);
While ((AuxA=AnioPC) and (AuxM<MesPC)) or (AuxM>12) or (AuxM<1) do
	begin
	TextColor(12);
	gotoxy(AuxX,AuxY);
	writeln('La fecha ingresada no puede ser anterior a la actual.');
	Inc(AuxY);
	gotoxy(AuxX,AuxY);
	writeln('Ademas, el mes ingrasado debe estar entre 1 y 12.');
	textcolor(15);
	Inc(AuxY);
	DesfaceVertical(AuxY);
	gotoxy(AuxX,AuxY);
	Write('Ingrese nuevamente el mes: ');
	SonidoError4();
	AuxX:=(AuxX+27);
	ValidacionEnteros2(AuxM,AuxY,AuxX);
	Inc(AuxY);
	AuxX:=(15);
	DesfaceVertical(AuxY);
	end;
gotoxy(AuxX,AuxY);
Write('Ingrese el dia: ');
AuxX:=(AuxX+16);
ValidacionEnteros2(AuxD,AuxY,AuxX);
AuxX:=(15);
Inc(AuxY);
DesfaceVertical(AuxY);
while ((AuxA=AnioPC) and (AuxM=MesPC) and (AuxD<DiaPC)) or (AuxD>31) or (AuxD<1) do
	begin
	TextColor(12);
	gotoxy(AuxX,AuxY);
	writeln('La fecha ingresada no puede ser anterior a la actual.');
	Inc(AuxY);
	DesfaceVertical(AuxY);
	textcolor(15);
	gotoxy(AuxX,AuxY);
	Write('Ingrese nuevamente el dia: ');
	SonidoError4();
	AuxX:=(AuxX+27);
	ValidacionEnteros2(AuxD,AuxY,AuxX);
	AuxX:=15;
	Inc(AuxY);
	DesfaceVertical(AuxY);
	end;
Fecha:=(IntToStr(AuxA)+'-'+IntToStr(AuxM)+'-'+IntToStr(AuxD));
textcolor(green);
gotoxy(AuxX,AuxY);
WriteLn('La fecha ',Fecha,' Fue registrada con exito.');
Inc(AuxY);
DesfaceVertical(AuxY);
Gotoxy(AuxX,AuxY);
WriteLn('Oprima "Enter/Intro" para continuar.');
textcolor(white);
Inc(AuxY);
DesfaceVertical(AuxY);
readkey;
end;

Procedure ValidacionEnteros(var DatoEntrada:integer; Var AuxY:Integer; Var AuxX:Integer);

Begin
DatoEntrada:=0;
while DatoEntrada= 0 do
begin;
try
	gotoxy(AuxX,AuxY);
	ReadLn(DatoEntrada);
except
	on Exception : EInOutError do
	begin
		SonidoError4();
		textcolor(12);
		AuxX:=(15);
		Inc(AuxY);
		DesfaceVertical(AuxY); //Solo se pone donde hay repeticion.
		gotoxy(AuxX,AuxY);
		Write('Porfavor solo ingrese numeros. Vuelva a intentarlo: ');
		textcolor(15);
		AuxX:=(AuxX+52);
	end;
end;
end;
end;

Procedure ValidacionEnteros2(var DatoEntrada:integer;Var AuxY:Integer; var AuxX:integer);

Begin
DatoEntrada:=0;
while DatoEntrada= 0 do
begin;
try
	gotoxy(AuxX,AuxY);
	ReadLn(DatoEntrada);
except
	on Exception : EInOutError do
	begin
		SonidoError4();
		textcolor(12);
		AuxX:=(15);
		Inc(AuxY);
		DesfaceVertical(AuxY); //Solo se pone donde hay repeticion.
		gotoxy(AuxX,AuxY);
		Write('Porfavor solo ingrese numeros. Vuelva a intentarlo: ');
		textcolor(15);
		AuxX:=(AuxX+52);
	end;
end;
end;
end;

Procedure ValidacionReales(var DatoEntrada:real;Var AuxY:Integer; var AuxX:integer);

Begin
DatoEntrada:=0;
while DatoEntrada= 0 do
begin;
try
	gotoxy(AuxX,AuxY);
	ReadLn(DatoEntrada);
except
	on Exception : EInOutError do
	begin
		SonidoError4();
		textcolor(12);
		AuxX:=(15);
		Inc(AuxY);
		DesfaceVertical(AuxY); //Solo se pone donde hay repeticion.
		gotoxy(AuxX,AuxY);
		Write('Porfavor solo ingrese numeros. Vuelva a intentarlo: ');
		textcolor(15);
		AuxX:=(AuxX+52)
	end;
end;
end;
end;

Procedure ValidacionHora(var DatoEntrada:String; Var AuxY:Integer; Var AuxX:Integer);

var 
Hora,Minuto:integer;


Begin
gotoxy(AuxX,AuxY);
Write('Ingrese la hora ( HH ): ');
AuxX:=(AuxX+24);
ValidacionEnteros2(Hora,AuxY,AuxX);
Inc(AuxY);
AuxX:=(15);
If ((Hora<1) or (Hora>24)) then
	begin
		while ((Hora<1) or (Hora>24)) do
		begin
		Inc(AuxY);
		Gotoxy(AuxX,AuxY);
		WriteLn('La hora ingresadas debe estar entre 1 y 24.');
		Inc(AuxY);
		Gotoxy(AuxX,AuxY);
		Write('Por favor, ingrese la hora nuevamente.: ');
		Inc(AuxY);
		DesfaceVertical(AuxY); //Solo se pone donde hay repeticion.
		AuxX:=(AuxX+40);
		ValidacionEnteros2(Hora,AuxY,AuxX);
		AuxX:=(15);
		end;
	end;
gotoxy(AuxX,AuxY);		
Write('Ingrese el minuto ( MM ): ');
AuxX:=(AuxX+26);
ValidacionEnteros2(Minuto,AuxY,AuxX);;
Inc(AuxY);
AuxX:=(15);
DesfaceVertical(AuxY); //Solo se pone donde hay repeticion.
If ((Minuto<0) or (Minuto>59)) then
	begin
		while ((Hora<0) or (Hora>59)) do
		begin
		gotoxy(AuxX,AuxY);
		WriteLn('El minuto ingresado debe estar entre 0 y 59.');
		Inc(AuxY);
		DesfaceVertical(AuxY); //Solo se pone donde hay repeticion.
		gotoxy(AuxX,AuxY);
		Write('Por favor, ingreselo nuevamente: ');
		AuxX:=(AuxX+33);
		ValidacionEnteros2(Minuto,AuxY,AuxX);
		Inc(AuxY);
		AuxX:=(15);
		end;
	end;
DatoEntrada:=(IntToStr(Hora)+':'+IntToStr(Minuto));
textcolor(green);
gotoxy(AuxX,AuxY);
WriteLN('La hora ',DatoEntrada,' fue registrada con exito.');
Inc(AuxY);
DesfaceVertical(AuxY); //Solo se pone donde hay repeticion.
gotoxy(AuxX,AuxY);
WriteLn('Oprima "Enter/Intro" para continuar.');
textcolor(white);
Inc(AuxY);
DesfaceVertical(AuxY);
readkey;
end;

Procedure ValidacionDNI(var DatoEntrada:integer; var AuxY:Integer; Var AuxX:Integer);

begin
gotoxy(AuxX,AuxY);
ValidacionEnteros(DatoEntrada,AuxY,AuxX);
while DatoEntrada<1 do
begin
	ValidacionEnteros(DatoEntrada,AuxY,AuxX);
end;
end;

Procedure Validacion_ID_LA(var A_LA:ArchivoLineaAerea; var ID:string; var R_LA:TipoLineaAerea);

var Pos,P:integer;

Begin
     Pos:=-1;
     P:=0;
     While (Not eof (A_LA)) and (Pos=-1) do
     Begin
          Leer_LA(A_LA,R_LA,P);
          If (ID=R_LA.ID_LineaAerea) then
          Begin
               Pos:=P;
               ID:=(R_LA.ID_LineaAerea);
          End;
     End;
End;

Procedure Validacion_ID_A(var A_Aero:ArchivoAeropuerto; var ID:string; var R_Aero:TipoAeropuerto);

var Pos,P:integer;

Begin
     Pos:=-1;
     P:=0;
     While (Not eof (A_Aero)) and (Pos=-1) do
     Begin
          Leer_A(A_Aero,R_Aero,P);
          If (ID=R_Aero.ID_Aeropuerto) then
          Begin
               Pos:=P;
               ID:=(R_Aero.ID_Aeropuerto);
          End;
     End;
End;
	
Procedure DesfaceVertical(var AuxY:Integer);

begin
If (AuxY>=27) then
	begin
	clrscr;
	Interfazprincipal;
	AuxY:=(9);
	end;
end;	
	
BEGIN	
END.
