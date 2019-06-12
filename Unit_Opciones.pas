Unit Unit_Opciones;

Interface

Uses Crt,sysutils,dos,Unit_Sonido,Unit_Archivos,Unit_Validacion;

//GENERAR - Copias de seguridad - BackUps
Procedure BackUpVuelo();
Procedure BackUpAeropuertos();
Procedure BackUpPasajeros();
Procedure BackUpVentas();
Procedure BackUpLineasAereas();
Procedure BackUpReservas();
procedure BackUpCompleto();

//CARGAR - Copias de seguridad - BackUps
Procedure CargarBackUpVuelo();
Procedure CargarBackUpAeropuertos();
Procedure CargarBackUpPasajeros();
Procedure CargarBackUpVentas();
Procedure CargarBackUpLineasAereas();
Procedure CargarBackUpReservas();
procedure CargarBackUpCompleto();

//Carcar - datos de prueba

Procedure CargarDatosAeropuertos(I:Integer);
Procedure CargarDatosLineasAereas(I:Integer);
Procedure CargarDatosPasajeros(I:Integer);

//Vaciar - archivos de datos
Procedure VaciarDatosAeropuertos();
Procedure VaciarDatosLineasAereas();
Procedure VaciarDatosVuelos();
Procedure VaciarDatosReservas();

Implementation

//Seccion para Generar BackUps
Procedure BackUpVuelo();

var ArchivoOriginal,Respaldo:file;
	size: longint;
	buffer: Array[1..32] of TipoVuelo;
	NumRead:Word;
	I:Word;

Begin
ClrScr;
assign(ArchivoOriginal,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeVuelos.dat');
assign(Respaldo,'C:\Trabajo practico final - Aerolineas\Respaldos\RespaldoVuelos.dat');
reset(ArchivoOriginal);
rewrite(Respaldo);
WriteLn('Espere porfavor, estamos realizando su copia de seguridad: ');
I:=0;
while not Eof(ArchivoOriginal) Do
begin
Inc(I);
Write(I,',');
blockread(ArchivoOriginal,buffer,sizeof(buffer),NumRead);
blockwrite(Respaldo,buffer,NumRead);
end;
close(ArchivoOriginal);
close(Respaldo);
writeln('Copia compleatada con exito!');
End;

Procedure BackUpAeropuertos();
var ArchivoOriginal,Respaldo:file;
	size:longint;
	buffer:Array[0..64] of TipoAeropuerto;
	NumRead:Word;
	I:Word;

Begin
ClrScr;
assign(ArchivoOriginal,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeAeropuertos.dat');
assign(Respaldo,'C:\Trabajo practico final - Aerolineas\Respaldos\RespaldoAeropuertos.dat');
reset(ArchivoOriginal);
rewrite(Respaldo);
WriteLn('Espere porfavor, estamos realizando su copia de seguridad: ');
I:=0;
while not Eof(ArchivoOriginal) Do
begin
Inc(I);
Write(I,',');
blockread(ArchivoOriginal,buffer,sizeof(buffer),NumRead);
blockwrite(Respaldo,buffer,NumRead);
end;
close(ArchivoOriginal);
close(Respaldo);
writeln('Copia compleatada con exito!');
End;

Procedure BackUpPasajeros();
var ArchivoOriginal,Respaldo:file;
	size:longint;
	buffer:Array[0..128] of TipoPasajero;
	NumRead:Word;
	I:Word;

Begin
ClrScr;
assign(ArchivoOriginal,'C:\Trabajo practico final - Aerolineas\Datos\DatosDePasajeros.dat');
assign(Respaldo,'C:\Trabajo practico final - Aerolineas\Respaldos\RespaldoPasajeros.dat');
reset(ArchivoOriginal);
rewrite(Respaldo);
WriteLn('Espere porfavor, estamos realizando su copia de seguridad: ');
I:=0;
while not Eof(ArchivoOriginal) Do
begin
Inc(I);
Write(I,',');
blockread(ArchivoOriginal,buffer,sizeof(buffer),NumRead);
blockwrite(Respaldo,buffer,NumRead);
end;
close(ArchivoOriginal);
close(Respaldo);
writeln('Copia compleatada con exito!');
End;

Procedure BackUpVentas();
var ArchivoOriginal,Respaldo:file;
	size:longint;
	buffer:Array[0..128] of TipoPasajero;
	NumRead:Word;
	I:Word;

Begin
ClrScr;
assign(ArchivoOriginal,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeVentas.dat');
assign(Respaldo,'C:\Trabajo practico final - Aerolineas\Respaldos\RespaldoVentas.dat');
reset(ArchivoOriginal);
rewrite(Respaldo);
WriteLn('Espere porfavor, estamos realizando su copia de seguridad: ');
I:=0;
while not Eof(ArchivoOriginal) Do
begin
Inc(I);
Write(I,',');
blockread(ArchivoOriginal,buffer,sizeof(buffer),NumRead);
blockwrite(Respaldo,buffer,NumRead);
end;
close(ArchivoOriginal);
close(Respaldo);
writeln('Copia compleatada con exito!');
End;

Procedure BackUpLineasAereas();
var ArchivoOriginal,Respaldo:file;
	size:longint;
	buffer:Array[0..128] of TipoPasajero;
	NumRead:Word;
	I:Word;

Begin
ClrScr;
assign(ArchivoOriginal,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeLineasAereas.dat');
assign(Respaldo,'C:\Trabajo practico final - Aerolineas\Respaldos\RespaldoLineasAereas.dat');
reset(ArchivoOriginal);
rewrite(Respaldo);
WriteLn('Espere porfavor, estamos realizando su copia de seguridad: ');
I:=0;
while not Eof(ArchivoOriginal) Do
begin
Inc(I);
Write(I,',');
blockread(ArchivoOriginal,buffer,sizeof(buffer),NumRead);
blockwrite(Respaldo,buffer,NumRead);
end;
close(ArchivoOriginal);
close(Respaldo);
writeln('Copia compleatada con exito!');
End;

Procedure BackUpReservas();
var ArchivoOriginal,Respaldo:file;
	size:longint;
	buffer:Array[0..128] of TipoPasajero;
	NumRead:Word;
	I:Word;

Begin
ClrScr;
assign(ArchivoOriginal,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeReservas.dat');
assign(Respaldo,'C:\Trabajo practico final - Aerolineas\Respaldos\RespaldoReservas.dat');
reset(ArchivoOriginal);
rewrite(Respaldo);
WriteLn('Espere porfavor, estamos realizando su copia de seguridad: ');
I:=0;
while not Eof(ArchivoOriginal) Do
begin
Inc(I);
Write(I,',');
blockread(ArchivoOriginal,buffer,sizeof(buffer),NumRead);
blockwrite(Respaldo,buffer,NumRead);
end;
close(ArchivoOriginal);
close(Respaldo);
writeln('Copia compleatada con exito!');
End;

//BackUp de todos los archivos.
procedure BackUpCompleto();

begin
BackUpVuelo();
BackUpVentas();
BackUpPasajeros();
BackUpReservas();
BackUpLineasAereas();
BackUpAeropuertos();
end;


//Seccion para Cargar BackUps
Procedure CargarBackUpVuelo();

var ArchivoOriginal,Respaldo:file;
	size: longint;
	buffer: Array[0..32] of TipoVuelo;
	NumRead:Word;
	I:Word;
	Acepto:String[2];
	Validacion:boolean;

Begin
ClrScr;
SonidoError4();
TextColor(12);
WriteLN('ATENCION! ¡Esta a punto de sobreescribir la base de datos de vuelos!');
WriteLn('Si decea continuar, escriba `SI` y opima enter: ');
Read(Acepto);
TextColor(11);
If (Acepto='SI') or (Acepto='Si') or (Acepto='si') or (Acepto='sI') then
	begin
	assign(ArchivoOriginal,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeVuelos.dat');
	assign(Respaldo,'C:\Trabajo practico final - Aerolineas\Respaldos\RespaldoVuelos.dat');
	reset(Respaldo);
	rewrite(ArchivoOriginal);
	WriteLn('Espere porfavor, estamos cargando su copia de seguridad: ');
	I:=0;
	while not Eof(Respaldo) Do
	begin
		Inc(I);
		Write(I,',');
		blockread(Respaldo,buffer,sizeof(buffer),NumRead);
		blockwrite(ArchivoOriginal,buffer,NumRead);
	end;
	close(ArchivoOriginal);
	close(Respaldo);
	Validacion:=(true);
	writeln('Carga compleatada con exito!');
End;
	TextColor(15);
	If (Validacion<>true) then
		WriteLn('La operacion fue abortada.');
End;

Procedure CargarBackUpAeropuertos();
var ArchivoOriginal,Respaldo:file;
	size:longint;
	buffer:Array[0..128] of TipoAeropuerto;
	NumRead:Word;
	I:Word;
	Acepto:String[2];
	Validacion:boolean;

Begin
ClrScr;
SonidoError4();
TextColor(12);
WriteLN('ATENCION! ¡Esta a punto de sobreescribir la base de datos de aeropuertos!');
WriteLn('Si decea continuar, escriba `SI` y opima enter: ');
Read(Acepto);
TextColor(11);
If (Acepto='SI') or (Acepto='Si') or (Acepto='si') or (Acepto='sI') then
	begin
	assign(ArchivoOriginal,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeAeropuertos.dat');
	assign(Respaldo,'C:\Trabajo practico final - Aerolineas\Respaldos\RespaldoAeropuertos.dat');
	reset(Respaldo);
	rewrite(ArchivoOriginal);
	WriteLn('Espere porfavor, estamos cargando su copia de seguridad: ');
	I:=0;
	while not Eof(Respaldo) Do
	begin
		Inc(I);
		Write(I,',');
		blockread(Respaldo,buffer,sizeof(buffer),NumRead);
		blockwrite(ArchivoOriginal,buffer,NumRead);
	end;
	close(ArchivoOriginal);
	close(Respaldo);
	Validacion:=(true);
	writeln('Carga compleatada con exito!');
End;
	TextColor(15);
	If (Validacion<>true) then
		WriteLn('La operacion fue abortada.');
End;

Procedure CargarBackUpPasajeros();
var ArchivoOriginal,Respaldo:file;
	size:longint;
	buffer:Array[0..128] of TipoPasajero;
	NumRead:Word;
	I:Word;
	Acepto:String[2];
	Validacion:boolean;

Begin
ClrScr;
SonidoError4();
TextColor(12);
WriteLN('ATENCION! ¡Esta a punto de sobreescribir la base de datos de pasajeros!');
WriteLn('Si decea continuar, escriba `SI` y opima enter: ');
Read(Acepto);
TextColor(11);
If (Acepto='SI') or (Acepto='Si') or (Acepto='si') or (Acepto='sI') then
	begin
	assign(ArchivoOriginal,'C:\Trabajo practico final - Aerolineas\Datos\DatosDePasajeros.dat');
	assign(Respaldo,'C:\Trabajo practico final - Aerolineas\Respaldos\RespaldoPasajeros.dat');
	reset(Respaldo);
	rewrite(ArchivoOriginal);
	WriteLn('Espere porfavor, estamos cargando su copia de seguridad: ');
	I:=0;
	while not Eof(Respaldo) Do
	begin
		Inc(I);
		Write(I,',');
		blockread(Respaldo,buffer,sizeof(buffer),NumRead);
		blockwrite(ArchivoOriginal,buffer,NumRead);
	end;
	close(ArchivoOriginal);
	close(Respaldo);
	Validacion:=(true);
	writeln('Carga compleatada con exito!');
End;
	TextColor(15);
	If (Validacion<>true) then
		WriteLn('La operacion fue abortada.');
End;

Procedure CargarBackUpVentas();
var ArchivoOriginal,Respaldo:file;
	size:longint;
	buffer:Array[0..128] of TipoPasajero;
	NumRead:Word;
	I:Word;
	Acepto:String[2];
	Validacion:boolean;

Begin
ClrScr;
SonidoError4();
TextColor(12);
WriteLN('ATENCION! ¡Esta a punto de sobreescribir la base de datos de ventas!');
WriteLn('Si decea continuar, escriba `SI` y opima enter: ');
Read(Acepto);
TextColor(11);
If (Acepto='SI') or (Acepto='Si') or (Acepto='si') or (Acepto='sI') then
	begin
	assign(ArchivoOriginal,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeVentas.dat');
	assign(Respaldo,'C:\Trabajo practico final - Aerolineas\Respaldos\RespaldoVentas.dat');
	reset(Respaldo);
	rewrite(ArchivoOriginal);
	WriteLn('Espere porfavor, estamos cargando su copia de seguridad: ');
	I:=0;
	while not Eof(Respaldo) Do
	begin
		Inc(I);
		Write(I,',');
		blockread(Respaldo,buffer,sizeof(buffer),NumRead);
		blockwrite(ArchivoOriginal,buffer,NumRead);
	end;
	close(ArchivoOriginal);
	close(Respaldo);
	Validacion:=(true);
	writeln('Carga compleatada con exito!');
End;
	TextColor(15);
	If (Validacion<>true) then
		WriteLn('La operacion fue abortada.');
End;

Procedure CargarBackUpLineasAereas();
var ArchivoOriginal,Respaldo:file;
	size:longint;
	buffer:Array[0..128] of TipoPasajero;
	NumRead:Word;
	I:Word;
	Acepto:String[2];
	Validacion:boolean;

Begin
ClrScr;
SonidoError4();
TextColor(12);
WriteLN('ATENCION! ¡Esta a punto de sobreescribir la base de datos de lineas aereas!');
WriteLn('Si decea continuar, escriba `SI` y opima enter: ');
Read(Acepto);
TextColor(11);
If (Acepto='SI') or (Acepto='Si') or (Acepto='si') or (Acepto='sI') then
	begin
	assign(ArchivoOriginal,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeLineasAereas.dat');
	assign(Respaldo,'C:\Trabajo practico final - Aerolineas\Respaldos\RespaldoLineasAereas.dat');
	reset(Respaldo);
	rewrite(ArchivoOriginal);
	WriteLn('Espere porfavor, estamos cargando su copia de seguridad: ');
	I:=0;
	while not Eof(Respaldo) Do
	begin
		Inc(I);
		Write(I,',');
		blockread(Respaldo,buffer,sizeof(buffer),NumRead);
		blockwrite(ArchivoOriginal,buffer,NumRead);
	end;
	close(ArchivoOriginal);
	close(Respaldo);
	Validacion:=(true);
	writeln('Carga compleatada con exito!');
End;
	TextColor(15);
	If (Validacion<>true) then
		WriteLn('La operacion fue abortada.');
End;

Procedure CargarBackUpReservas();
var ArchivoOriginal,Respaldo:file;
	size:longint;
	buffer:Array[0..128] of TipoPasajero;
	NumRead:Word;
	I:Word;
	Acepto:String[2];
	Validacion:boolean;

Begin
ClrScr;
SonidoError4();
TextColor(12);
WriteLN('ATENCION! ¡Esta a punto de sobreescribir la base de datos de reservas!');
WriteLn('Si decea continuar, escriba `SI` y opima enter: ');
Read(Acepto);
TextColor(11);
If (Acepto='SI') or (Acepto='Si') or (Acepto='si') or (Acepto='sI') then
	begin
	assign(ArchivoOriginal,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeReservas.dat');
	assign(Respaldo,'C:\Trabajo practico final - Aerolineas\Respaldos\RespaldoReservas.dat');
	reset(Respaldo);
	rewrite(ArchivoOriginal);
	WriteLn('Espere porfavor, estamos cargando su copia de seguridad: ');
	I:=0;
	while not Eof(Respaldo) Do
	begin
		Inc(I);
		Write(I,',');
		blockread(Respaldo,buffer,sizeof(buffer),NumRead);
		blockwrite(ArchivoOriginal,buffer,NumRead);
	end;
	close(ArchivoOriginal);
	close(Respaldo);
	Validacion:=(true);
	writeln('Carga compleatada con exito!');
End;
	TextColor(15);
	If (Validacion<>true) then
		WriteLn('La operacion fue abortada.');
End;

procedure CargarBackUpCompleto();

begin
CargarBackUpVuelo();
CargarBackUpVentas();
CargarBackUpPasajeros();
CargarBackUpReservas();
CargarBackUpLineasAereas();
CargarBackUpAeropuertos();
end;

Procedure CargarDatosAeropuertos(I:Integer);

var
	J,Pos,ID_Aux:integer;
    Aux,Bus:string;
    R_Aero:TipoAeropuerto;
    A_Aero:ArchivoAeropuerto;

begin
Clrscr;
WriteLN('Recuerde que, una vez iniciada, la carga de datos no debe ser interrumpida.');
WriteLN('Desea continuar escriba "SI" a continuacion, de lo contrario escriba "NO".');
SonidoError4();
Readln(Aux);
IF ((Aux='SI') or (Aux='Si') or (Aux='sI') or (Aux='si')) then
begin
	Write('Ingrese la cantidad de datos que desee cargar: ');
	Read(I);
	For J:=1 to I do
	begin
		Bus:=('Aeropuerto de prueba '+IntToStr(J));
		Abrir_A(A_Aero);
		Busqueda_A(A_Aero,Pos,Bus,R_Aero,ID_Aux);
		If (Pos=-1)then
		Begin
			(R_Aero.ID_Aeropuerto):=(IntToStr(ID_Aux));
			Validacion_ID_A(A_Aero,R_Aero.ID_Aeropuerto,R_Aero);
			(R_Aero.Ciudad):=('Ciudad de prueba '+IntToStr(J));
			(R_Aero.Pais):=('Pais de prueba '+IntToStr(J));
			R_Aero.Activo:=True;
			R_Aero.Nombre:=Bus;
			Guardar_A(A_Aero,R_Aero);
			WriteLn('El '+bus+' ha sido cargado con exito.');
			Cerrar_A(A_Aero);
		end
		else
		begin
			Cerrar_A(A_Aero);
			Write('El Aeropuerto de prueba '+IntToStr(J)+' ya estaba cargado previamente.');
		end;
	end;
	writeln('Fin de la carga de datos, se cargaron');
	readkey;
end;
end;

Procedure CargarDatosLineasAereas(I:Integer);

var
	J,Pos,ID_Aux:integer;
    Aux,Bus:string;
    R_LA:TipoLineaAerea;
    A_LA:ArchivoLineaAerea;

begin
Clrscr;
WriteLN('Recuerde que, una vez iniciada, la carga de datos no debe ser interrumpida.');
WriteLN('Desea continuar escriba "SI" a continuacion, de lo contrario escriba "NO".');
SonidoError4();
Readln(Aux);
IF ((Aux='SI') or (Aux='Si') or (Aux='sI') or (Aux='si')) then
begin
	Write('Ingrese la cantidad de datos que desee cargar: ');
	Read(I);
	For J:=1 to I do
	begin
		Bus:=('Linea Aerea '+IntToStr(J));
		Abrir_LA(A_LA);
		Busqueda_LA(A_LA,Bus,Pos,R_LA,ID_Aux);
		If (Pos=-1)then
		Begin
			// Validacion de ID.
			R_LA.ID_LineaAerea:=(IntToStr(ID_Aux));
			Validacion_ID_LA(A_LA,R_LA.ID_LineaAerea,R_LA);
			// Carga de datos.
			(R_LA.Cuit):=('99-999992-'+IntToStr(J));
			(R_LA.Domicilio):=('Calle '+IntToStr(J));
			R_LA.Activo:=True;
			R_LA.Nombre:=Bus;
			Guardar_LA(A_LA,R_LA);
			WriteLn('El '+bus+' ha sido cargado con exito.');
			Cerrar_LA(A_LA);
		end
		else
		begin
			Cerrar_LA(A_LA);
			Write('El Aeropuerto de prueba '+IntToStr(J)+' ya estaba cargado previamente.');
		end;
	end;
	writeln('Fin de la carga de datos, se cargaron');
	readkey;
end;
end;


Procedure CargarDatosPasajeros(I:Integer);

var
	Bus,J,Pos:integer;
    Aux:string;
    R_Pasaj:TipoPasajero;
    A_Pasaj:ArchivoPasajero;

begin
Clrscr;
WriteLN('Recuerde que, una vez iniciada, la carga de datos no debe ser interrumpida.');
WriteLN('Desea continuar escriba "SI" a continuacion, de lo contrario escriba "NO".');
SonidoError4();
Readln(Aux);
IF ((Aux='SI') or (Aux='Si') or (Aux='sI') or (Aux='si')) then
begin
	Write('Ingrese la cantidad de datos que desee cargar: ');
	Read(I);
	For J:=1 to I do
	begin
		Bus:=(98193189+(J));
		Abrir_P(A_Pasaj);
		Busqueda_P(A_Pasaj,Bus,Pos,R_Pasaj);
		If (Pos=-1)then
		Begin
			(R_Pasaj.Apellido):=('Lopez');
			(R_Pasaj.Nombre):=('Roman '+(IntToStr(J)));
			(R_Pasaj.Edad):=(3+J);
			R_Pasaj.Activo:=True;
			R_Pasaj.ID_Pasajero:=Bus;
			Guardar_P(A_Pasaj,R_Pasaj);
			WriteLn('El pasajero ',R_Pasaj.Apellido,' ',R_Pasaj.Nombre,' ha sido cargado con exito.');
			Cerrar_P(A_Pasaj);
		end
		else
		begin
			Cerrar_P(A_Pasaj);
			Write('El pasajero ',R_Pasaj.Apellido,' ',R_Pasaj.Nombre,' ya estaba cargado previamente.');
		end;
	end;
	writeln('Fin de la carga de datos, se cargaron');
	readkey;
end;
end;


Procedure VaciarDatosAeropuertos();

var
	Aux:String[2];
	Verificar:integer;
    A_Aero:ArchivoAeropuerto;

begin
Aux:=('');
Clrscr;
WriteLN('Recuerde que, una vez iniciada, la carga de datos no debe ser interrumpida.');
WriteLN('Desea continuar escriba "SI" a continuacion, de lo contrario escriba "NO".');
SonidoError4();
Readln(Aux);
IF ((Aux='SI') or (Aux='Si') or (Aux='sI') or (Aux='si')) then
begin
	Abrir_A(A_Aero);
	Cerrar_A(A_Aero);
	Erase (A_Aero);
	{$i-}
	Assign(A_Aero,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeAeropuertos.dat');
	Rewrite(A_Aero);
	{$I+}
	close(A_Aero);
	Verificar:=(IOresult)
end;
	If Verificar=0 then
	begin
		writeln('Los datos de aeropuertos han sido eliminados.');
	end
	else
	begin
		writeln('No se ha podido completar la operacion.');
	end;
end;

Procedure VaciarDatosLineasAereas();

var
	Aux:String[2];
	Verificar:integer;
    A_LA:ArchivoLineaAerea;

begin
Aux:=('');
Clrscr;
WriteLN('Recuerde que, una vez iniciada, la carga de datos no debe ser interrumpida.');
WriteLN('Desea continuar escriba "SI" a continuacion, de lo contrario escriba "NO".');
SonidoError4();
Readln(Aux);
IF ((Aux='SI') or (Aux='Si') or (Aux='sI') or (Aux='si')) then
begin
    Abrir_LA(A_LA);
	Cerrar_LA(A_LA);
	Erase(A_LA);
	{$i-}
	Assign(A_LA,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeLineasAereas.dat');
	Rewrite(A_LA);
	{$I+}
	close(A_LA);
	Verificar:=(IOresult);
end;
	If Verificar=0 then
	begin
		writeln('Los datos de aeropuertos han sido eliminados.');
	end
	else
	begin
		writeln('No se ha podido completar la operacion.');
	end;
end;

Procedure VaciarDatosVuelos();

var
	Aux:String[2];
	Verificar:integer;
    A_Vue:ArchivoVuelo;

begin
Aux:=('');
Clrscr;
WriteLN('Recuerde que, una vez iniciada, la carga de datos no debe ser interrumpida.');
WriteLN('Desea continuar escriba "SI" a continuacion, de lo contrario escriba "NO".');
SonidoError4();
Readln(Aux);
IF ((Aux='SI') or (Aux='Si') or (Aux='sI') or (Aux='si')) then
begin
    Abrir_VU(A_Vue);
	Cerrar_VU(A_Vue);
	Erase(A_Vue);
	{$i-}
	Assign(A_Vue,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeVuelos.dat');
	Rewrite(A_Vue);
	{$I+}
	close(A_Vue);
	Verificar:=(IOresult);
end;
	If Verificar=0 then
	begin
		writeln('Los datos de aeropuertos han sido eliminados.');
	end
	else
	begin
		writeln('No se ha podido completar la operacion.');
	end;
end;

Procedure VaciarDatosReservas();

var
	Aux:String[2];
    A_Res:ArchivoReserva;
    Verificar:integer;

begin
Verificar:=(1);
Aux:=('');
Clrscr;
WriteLN('Recuerde que, una vez iniciada, la carga de datos no debe ser interrumpida.');
WriteLN('Desea continuar escriba "SI" a continuacion, de lo contrario escriba "NO".');
SonidoError4();
Readln(Aux);
IF ((Aux='SI') or (Aux='Si') or (Aux='sI') or (Aux='si')) then
begin
    Abrir_R(A_Res);
	Cerrar_R(A_Res);
	Erase(A_Res);
	{$i-}
	Assign(A_Res,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeReservas.dat');
	Rewrite(A_Res);
	{$I+}
	close(A_Res);
	Verificar:=(IOresult);
end;
	If Verificar=0 then
	begin
		writeln('Los datos de aeropuertos han sido eliminados.');
	end
	else
	begin
		writeln('No se ha podido completar la operacion.');
	end;
end;

Begin
End.
