Unit Unit_Busquedas;

interface
uses crt,Unit_Archivos,Unit_Aeropuerto,Unit_LineaAerea,Unit_Interfaz;

//Consulta vuelos:
Procedure Fecha_Vuelo_Aeropuerto(Var A_Vue:ArchivoVuelo;var A_Aero:ArchivoAeropuerto);
Procedure Fechas_Vuelo_Aerolinea(Var A_Vue:ArchivoVuelo;var A_LA:ArchivoLineaAerea);
Procedure Pasajero_Vuelo(Var A_Res:ArchivoReserva;var A_Vue:ArchivoVuelo;var A_Pasaj:ArchivoPasajero);

//Consulta vuelos:


Implementation

//Procedimientos de consultas de vuelos:
Procedure Fecha_Vuelo_Aeropuerto(Var A_Vue:ArchivoVuelo;var A_Aero:ArchivoAeropuerto);
var i,j,Pos,cantidad,c,ID_Aux:integer;
    opc:char;
    Buscado,aeropuerto:string[20];
    R_Vue:TipoVuelo;
    R_Aero:TipoAeropuerto;
    Vec1:TipoVectorVueloBB;
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(23,5);
     Writeln('  Segun una fecha, listado de vuelos de un determinado aeropuerto');
     GotoXY(15,9);
     Writeln('  Ingrese la fecha (DD/MM/AAAA) que desea buscar:');
     GotoXY(64,9);
     Readln(Buscado);
     Cargar_VU(A_Vue,Vec1, cantidad);
     Burbuja_VU(Vec1, cantidad);
     Abrir_VU(A_Vue);
     GotoXY(15,10);
     Writeln('  Ingrese el nombre del aeropuerto que desea buscar:');
     GotoXY(67,10);
     Readln(aeropuerto);
     Pos:=-1;
     Abrir_A(A_Aero);
     Busqueda_A(A_Aero,Pos,aeropuerto,R_Aero,ID_Aux);
     Cerrar_A(A_Aero);
     If (Pos<>-1) then
     Begin
          aeropuerto:=R_Aero.ID_Aeropuerto;
          Clrscr;
          i:=1;
          opc:=#13;
          pos:=2;
          gotoxy(1,1);
          Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
          While(i<=cantidad) and (opc<>#27) do
          Begin
               Leer_VU(A_Vue,R_Vue,Vec1[i].pos);
               If (Buscado=R_Vue.FechaP) and (aeropuerto=R_Vue.Origen) then
               begin
                    GotoXY(2,pos);
                    Writeln(R_Vue.ID_Vuelo);
                    GotoXY(11,pos);
                    Writeln('| ',R_Vue.ID_LineaAerea);
                    GotoXY(19,pos);
                    Writeln('| ',R_Vue.Origen);
                    GotoXY(28,pos);
                    Writeln('| ',R_Vue.FechaP);
                    GotoXY(41,pos);
                    Writeln('| ',R_Vue.HoraP);
                    GotoXY(51,pos);
                    Writeln('| ',R_Vue.Destino);
                    GotoXY(61,pos);
                    Writeln('| ',R_Vue.FechaL);
                    GotoXY(74,pos);
                    Writeln('| ',R_Vue.HoraL);
                    GotoXY(84,pos);
                    c:=0;
                    For j:= 1 to 3 do
                    Begin
                         If (R_Vue.Escalas[j]<>'') then
                            inc(c);
                    End;
                    Writeln('| ',c);
                    GotoXY(96,pos);
                    Writeln('| ',R_Vue.Cant_Pasajeros);
                    GotoXY(108,pos);
                    Writeln('| ',R_Vue.Estado);
                    inc(pos);
               end;
               inc(i);
               If ((pos=28) or (i=cantidad+1)) then
               Begin
                    GotoXY(1,29);
                    TextColor(White);
                    TextBackground(0);
                    Writeln(' a-Anterior | s-Siguiente | Esc-Salir   :                                                                         ');
                    Repeat
                    GotoXY(42,29);
                    opc:=readkey;
                    Until  (opc=#27) or (opc='a') or (opc='s') or (opc='v');
               If (opc='a') and (i>=27) then
               begin
                    If (i>27) then
                    i:=i-27-(pos-3)
                    Else
                    i:=1;
                    pos:=2;
                    clrscr;
                    TextColor(12);
                    TextBackground(0);
                    gotoxy(1,1);
                    Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
               end;
               If (opc='s') and (i<cantidad)then
               begin
                    pos:=2;
                    clrscr;
                    TextColor(12);
                    TextBackground(0);
                    gotoxy(1,1);
                    Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
               end;
          end;
          end;
     End
     Else
     Begin
         GotoXY(15,11);
         Writeln('  El aeropuerto no existe');
     End;
     Cerrar_VU(A_Vue);
     Readkey;
End;

Procedure Fechas_Vuelo_Aerolinea(Var A_Vue:ArchivoVuelo;var A_LA:ArchivoLineaAerea);
var Pos,cantidad,i,codigo,DI1,MI1,AI1,DI2,MI2,AI2,DIP,MIP,AIP,j,c,ID_Aux:integer;
    opc:char;
    Fecha1,Fecha2,Aerolinea,DS1,MS1,AS1,DS2,MS2,AS2,DSP,MSP,ASP:string[20];
    R_Vue:TipoVuelo;
    R_LA:TipoLineaAerea;
    Vec:TipoVectorVueloBB;
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(20,5);
     Writeln('  Segun un rango de fechas, listado de vuelos de una determinada linea aerea');
     GotoXY(15,9);
     Writeln('  Ingrese la primer fecha (DD/MM/AAAA) que desea buscar:');
     GotoXY(71,9);
     Readln(Fecha1);
     GotoXY(15,10);
     Writeln('  Ingrese la segunda fecha (DD/MM/AAAA) que desea buscar:');
     GotoXY(72,10);
     Readln(Fecha2);
     Cargar_VU(A_Vue,Vec, cantidad);
     Burbuja_VU(Vec, cantidad);
     Abrir_VU(A_Vue);
     GotoXY(15,11);
     Writeln('  Ingrese el nombre de la linea aerea que desea buscar:');
     GotoXY(70,11);
     Readln(Aerolinea);
     Pos:=-1;
     Abrir_LA(A_LA);
     Busqueda_LA(A_LA,Aerolinea,Pos,R_LA,ID_Aux);
     Cerrar_LA(A_LA);
     If (Pos<>-1) then
     Begin
          Aerolinea:=R_LA.ID_LineaAerea;
          Clrscr;
          i:=1;
          opc:=#13;
          Pos:=2;
          gotoxy(1,1);
          Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
          While(i<=cantidad) and (opc<>#27) do
          Begin
               Leer_VU(A_Vue,R_Vue,Vec[i].Pos);
               DS1:= copy(Fecha1,1,2);
               MS1:= copy(Fecha1,4,2);
               AS1:= copy(Fecha1,7,4);
               DS2:= copy(Fecha2,1,2);
               MS2:= copy(Fecha2,4,2);
               AS2:= copy(Fecha2,7,4);
               DSP:= copy(R_Vue.FechaP,1,2);
               MSP:= copy(R_Vue.FechaP,4,2);
               ASP:= copy(R_Vue.FechaP,7,4);
               Val(DS1,DI1,codigo);
               Val(MS1,MI1,codigo);
               Val(AS1,AI1,codigo);
               Val(DS2,DI2,codigo);
               Val(MS2,MI2,codigo);
               Val(AS2,AI2,codigo);
               Val(DSP,DIP,codigo);
               Val(MSP,MIP,codigo);
               Val(ASP,AIP,codigo);
               If (Aerolinea=R_Vue.ID_LineaAerea) and(((AI1<=AIP) and (AI2>=AIP)) and((MI1<=MIP) and (MI2>=MIP))and(((MI1=MIP)and(DIP>=DI1))or((MIP=MI2)and(DIP<=DI2))or((MIP>MI1)and(MIP<MI2)))) then
               begin
                    GotoXY(2,pos);
                    Writeln(R_Vue.ID_Vuelo);
                    GotoXY(11,pos);
                    Writeln('| ',R_Vue.ID_LineaAerea);
                    GotoXY(19,pos);
                    Writeln('| ',R_Vue.Origen);
                    GotoXY(28,pos);
                    Writeln('| ',R_Vue.FechaP);
                    GotoXY(41,pos);
                    Writeln('| ',R_Vue.HoraP);
                    GotoXY(51,pos);
                    Writeln('| ',R_Vue.Destino);
                    GotoXY(61,pos);
                    Writeln('| ',R_Vue.FechaL);
                    GotoXY(74,pos);
                    Writeln('| ',R_Vue.HoraL);
                    GotoXY(84,pos);
                    c:=0;
                    For j:= 1 to 3 do
                    Begin
                         If (R_Vue.Escalas[j]<>'') then
                            inc(c);
                    End;
                    Writeln('| ',c);
                    GotoXY(96,pos);
                    Writeln('| ',R_Vue.Cant_Pasajeros);
                    GotoXY(108,pos);
                    Writeln('| ',R_Vue.Estado);
                    inc(pos);
               end;
               inc(i);
               If ((pos=28) or (i=cantidad+1)) then
               Begin
                    TextColor(White);
                    TextBackground(0);
                    GotoXY(1,29);
                    Writeln(' a-Anterior | s-Siguiente | esc-Salir   :                                                                     ');
                    Repeat
                    GotoXY(42,29);
                    opc:=readkey;
                    Until  (opc=#27) or (opc='a') or (opc='s');
               If (opc='a') and (i>=27) then
               begin
                    If (i>27) then
                    i:=i-27-(pos-3)
                    Else
                    i:=1;
                    pos:=2;
                    clrscr;
                    TextColor(12);
                    TextBackground(0);
                    gotoxy(1,1);
                    Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
               end;
               If (opc='s') and (i<cantidad)then
               begin
                    pos:=2;
                    clrscr;
                    TextColor(12);
                    TextBackground(0);
                    gotoxy(1,1);
                    Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
               end;
          end;
          End;
     End
     Else
     Begin
         GotoXY(15,12);
         Writeln('  La linea aerea no existe');
     End;
     Cerrar_VU(A_Vue);
     Readkey;
End;

Procedure Pasajero_Vuelo(Var A_Res:ArchivoReserva;var A_Vue:ArchivoVuelo;var A_Pasaj:ArchivoPasajero);
Var Buscado,i,c,j,pos,cantidad,cantidad1,posvuelo:integer;
    Vec:TipoVectorReserva;
    Vec1:TipoVectorVueloBB;
    R_Res:TipoReserva;
    R_Vue:TipoVuelo;
    R_Pasaj:TipoPasajero;
    opc:char;
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(25,5);
     Writeln('  Segun un pasajero, listado de vuelos que ha realizado');
     GotoXY(15,9);
     Writeln('  Ingrese el DNI de la persona que desea ver los vuelos que realizo:');
     GotoXY(83,9);
     Readln(Buscado);
     Cargar_R(A_Res,Vec,cantidad);
     Cargar_VU(A_Vue,Vec1,cantidad1);
     Burbuja_VU(Vec1,cantidad1);
     Abrir_R(A_Res);
     Abrir_VU(A_Vue);
     Pos:=-1;
     Abrir_P(A_Pasaj);
     Busqueda_P(A_Pasaj,Buscado,Pos,R_Pasaj);
     Cerrar_P(A_Pasaj);
     If (pos<>-1) then
     Begin
          clrscr;
          i:=1;
          opc:=#13;
          pos:=2;
          gotoxy(1,1);
          Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
          While(i<=cantidad) and (opc<>#27) do
          Begin
               Leer_R(A_Res,R_Res,Vec[i].Pos);
               inc(i);
               If (Buscado=R_Res.ID_Pasajero) then
               Begin
                    Busqueda_VU(A_Vue,R_Res.ID_Vuelo,posvuelo,R_Vue);
                    Leer_VU(A_Vue,R_Vue,posvuelo);
                    GotoXY(2,pos);
                    Writeln(R_Vue.ID_Vuelo);
                    GotoXY(11,pos);
                    Writeln('| ',R_Vue.ID_LineaAerea);
                    GotoXY(19,pos);
                    Writeln('| ',R_Vue.Origen);
                    GotoXY(28,pos);
                    Writeln('| ',R_Vue.FechaP);
                    GotoXY(41,pos);
                    Writeln('| ',R_Vue.HoraP);
                    GotoXY(51,pos);
                    Writeln('| ',R_Vue.Destino);
                    GotoXY(61,pos);
                    Writeln('| ',R_Vue.FechaL);
                    GotoXY(74,pos);
                    Writeln('| ',R_Vue.HoraL);
                    GotoXY(84,pos);
                    c:=0;
                    For j:= 1 to 3 do
                    Begin
                         If (R_Vue.Escalas[j]<>'') then
                         inc(c);
                    End;
                    Writeln('| ',c);
                    GotoXY(96,pos);
                    Writeln('| ',R_Vue.Cant_Pasajeros);
                    GotoXY(108,pos);
                    Writeln('| ',R_Vue.Estado);
                    inc(pos);
                    end;
                    If ((pos=28) or (i=cantidad+1)) then
                    Begin
                         TextColor(White);
                         TextBackground(0);
                         GotoXY(1,29);
                         Writeln(' a-Anterior | s-Siguiente | esc-Salir   :                                                                       ');
                         Repeat
                         GotoXY(42,29);
                         opc:=readkey;
                         Until  (opc=#27) or (opc='a') or (opc='s');
                    If (opc='a') and (i>=27) then
                    begin
                         If (i>27) then
                         i:=i-27-(pos-3)
                         Else
                         i:=1;
                         pos:=2;
                         clrscr;
                         TextColor(12);
                         TextBackground(0);
                         gotoxy(1,1);
                         Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
                    end;
                    If (opc='s') and (i<cantidad)then
                    begin
                         pos:=2;
                         clrscr;
                         TextColor(12);
                         TextBackground(0);
                         gotoxy(1,1);
                         Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
                    end;
               end;
           end;
    End
    Else
    Begin
         GotoXY(15,10);
         Writeln('  El pasajero no existe');
    End;
    Readkey;
    Cerrar_R(A_Res);
    Cerrar_VU(A_Vue);
End;


BEGIN
END.

