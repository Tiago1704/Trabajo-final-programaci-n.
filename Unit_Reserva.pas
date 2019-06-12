Unit Unit_Reserva;

interface

Uses crt,Unit_Archivos,Unit_Interfaz,Unit_Vuelo,Unit_Pasajero,Unit_Validacion;

Procedure Alta_Reserva(var A_Res:ArchivoReserva;var A_Pasaj:ArchivoPasajero;var A_Vue:ArchivoVuelo;var A_Aero:ArchivoAeropuerto;var A_LA:ArchivoLineaAerea);
Procedure Baja_Reserva(Var A_Res:ArchivoReserva);
Procedure Modificar_Reserva(var A_Res:ArchivoReserva);
Procedure Consulta_Reserva(var A_Res:ArchivoReserva;var A_Pasaj:ArchivoPasajero;var A_Vue:ArchivoVuelo);

implementation


Procedure Alta_Reserva(var A_Res:ArchivoReserva;var A_Pasaj:ArchivoPasajero;var A_Vue:ArchivoVuelo;var A_Aero:ArchivoAeropuerto;var A_LA:ArchivoLineaAerea);
Var Pos1,Pos2:integer;
    R_Res:TipoReserva;
    R_Pasaj:TipoPasajero;
    R_Vue:TipoVuelo;
    Opc1,Opc2:char;
    PunteroY,PunteroX:LongInt;
    
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     Abrir_R(A_Res);
     GotoXY(26,5);
//
     Writeln('  Ingrese los datos para realizar el alta de la reserva');
     GotoXY(15,9);
     Writeln('  ID Vuelo:');
     Pos2:=-1;
     Repeat
		   PunteroX:=(27);
		   PunteroY:=(9);
		   ValidacionEnteros2(R_Res.ID_Vuelo,PunteroY,PunteroX);
		   Abrir_VU(A_Vue);
		   Busqueda_VU(A_Vue,R_Res.ID_Vuelo,Pos2,R_Vue);
		   Cerrar_VU(A_Vue);
           If (Pos2<>-1) then
           Begin
				//okey
           End
           Else
           Begin
                Repeat
                GotoXY(16,10);
                Writeln(' Esc: ingresar de nuevo | Enter: dar de alta');
                Opc2:=readkey;
                Until (Opc2=#27) or (Opc2=#13);
                If(Opc2=#27) then
                Begin
                     GotoXY(16,10);
                     Writeln('                                                     ');
                     GotoXY(26,9);
                     Writeln('                      ');
                End
                Else
                Begin
                     Alta_Vuelo(A_Vue,A_Aero,A_LA);
                     Abrir_VU(A_Vue);
                     Busqueda_VU(A_Vue,R_Res.ID_Vuelo,Pos2,R_Vue);
                     Cerrar_VU(A_Vue);
                     TextColor(White);
                     TextBackground(0);
                     clrscr;
                     TextColor(12);
                     TextBackground(0);
                     InterfazPrincipal;
                     GotoXY(15,9);
                     Writeln('  ID Vuelo:');
                End;
          End;
     Until (Pos2<>-1);
     
     clrscr;
     InterfazPrincipal;
     Gotoxy(45,5);
     Writeln('Presione enter para ingresar datos');
     readkey();
     PunteroY:=(9);
     PunteroX:=(15);
     ValidacionFecha(R_Res.Fecha,PunteroY,PunteroX);
     inc(PunteroY);
     ValidacionHora(R_Res.Hora,PunteroY,PunteroX);
     (PunteroY):=(PunteroY+2);
     DesfaceVertical(PunteroY);
     gotoxy(15,PunteroY);   
     Write('Ingrese el costo: $');
     PunteroX:=(PunteroX+19);
     ValidacionReales(R_Res.Costo,PunteroY,PunteroX);
     Pos1:=-1;
     inc(PunteroY);
     gotoxy(15,PunteroY);
	 Write('Ingrese el DNI:');
	 
     Repeat
           PunteroX:=(15+15);
           ValidacionDNI(R_Res.ID_Pasajero,PunteroY,PunteroX);
           Abrir_P(A_Pasaj);
           Busqueda_P(A_Pasaj,R_Res.ID_Pasajero,Pos1,R_Pasaj);
           Cerrar_P(A_Pasaj);
           If (Pos1<>-1) then
           Begin
				clrscr;
		   End
           Else
           Begin
                Repeat
                InterfazAux;
                gotoxy(16,9);
                Writeln('El pasajero no existe. Oprima:');
                gotoxy(16,10);
                Writeln('Borrar/Backspace: ingresar de nuevo | Enter: dar de alta');
                Opc1:=readkey;
                Until (Opc1=#08) or (Opc1=#13);
                If(Opc1=#08) then
                Begin
					clrscr;
					InterfazAux;
					gotoxy(15,9);
					Write('Ingrese el DNI:');
					PunteroY:=(9);
                End
                Else
                Begin
                     Alta_Pasajero(A_Pasaj);
                     Abrir_P(A_Pasaj);
                     Busqueda_P(A_Pasaj,R_Res.ID_Pasajero,Pos1,R_Pasaj);
                     Cerrar_P(A_Pasaj);
                     TextColor(White);
                     TextBackground(0);
                     TextColor(12);
                     TextBackground(0);
                     InterfazPrincipal;
                     GotoXY(15,14);
                     Writeln('Ingrese el DNI:');
                End;
          End;
     Until (Pos1<>-1);
     R_Res.Activo:=True;
     R_Res.ID_Reserva:=(Filesize(A_Res)+1);
     Guardar_R(A_Res,R_Res);
     clrscr;
     InterfazAux;;
     InterfazAltas;
     Cerrar_R(A_Res);
End;

Procedure Baja_Reserva(Var A_Res:ArchivoReserva);
Var Bus:integer;
    Pos:integer;
    R_Res:TipoReserva;
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(33,5);
     Writeln('  Ingrese el codigo de reserva que desea dar de baja:');
     GotoXY(15,9);
     Readln(Bus);
     Abrir_R(A_Res);
     Busqueda_R(A_Res,Bus,Pos,R_Res);
     If (Pos<>-1) then
     Begin
          Leer_R(A_Res,R_Res,Pos);
          If (R_Res.Activo=True) then
          Begin
               R_Res.Activo:=False;
               Modificar_R(A_Res,Pos,R_Res);
               InterfazBajas;
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  La reserva ya esta dada de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  La reserva no existe');
          Readkey;
     End;
     Cerrar_R(A_Res);
End;

Procedure Modificar_Reserva(var A_Res:ArchivoReserva);
Var Bus:integer;
    Pos:integer;
    R_Res:TipoReserva;
    Opc:char;
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(15,5);
     Writeln('  Ingrese el codigo de la reserva que desea modificar:');
     GotoXY(69,5);
     Readln(Bus);
     Abrir_R(A_Res);
     Busqueda_R(A_Res,Bus,Pos,R_Res);
     If (Pos<>-1) then
     Begin
          Leer_R(A_Res,R_Res,Pos);
          If (R_Res.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(0);
                     Clrscr;
                     TextColor(12);
                     TextBackground(0);
                     InterfazPrincipal;
                     GotoXY(20,5);
                     Writeln('  La reserva esta dada de alta');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> ID Reserva: ',R_Res.ID_Reserva);
                     GotoXY(31,11);
                     Writeln('> ID Pasajero: ',R_Res.ID_Pasajero);
                     GotoXY(31,12);
                     Writeln('> ID Vuelo: ',R_Res.ID_Vuelo);
                     GotoXY(31,13);
                     Writeln('> Costo: ',R_Res.Costo:2:2);
                     GotoXY(31,14);
                     Writeln('> Fecha: ',R_Res.Fecha:0);
                     GotoXY(31,15);
                     Writeln('> Hora: ',R_Res.Hora);
                     GotoXY(15,17);
                     Writeln('  Elija el campo que desea modificar:');
                     GotoXY(52,18);
                     Writeln('--> 1- Fecha');
                     GotoXY(52,19);
                     Writeln('--> 2- Hora');
                     GotoXY(52,20);
                     Writeln('--> Esc- Salir');
                     GotoXY(52,17);
                     Opc:=readkey;
                     Case Opc of
                          '1':Begin
                                   TextColor(White);
                                   TextBackground(0);
                                   Clrscr;
                                   GotoXY(1,29);
                                   Writeln(' Enter-Para continuar ');
                                   TextColor(12);
                                   TextBackground(0);
                                   InterfazPrincipal;
                                   GotoXY(35,5);
                                   Writeln('  Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('  Fecha(DD/MM/AAAA):');
                                   GotoXY(35,9);
                                   Readln(R_Res.Fecha);
                                   Modificar_R(A_Res,Pos,R_Res);
                                   InterfazModificaciones;
                              End;
                          '2':Begin
                                   TextColor(White);
                                   TextBackground(0);
                                   Clrscr;
                                   TextColor(12);
                                   TextBackground(0);
                                   InterfazPrincipal;
                                   GotoXY(35,5);
                                   Writeln('  Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('  Hora(HH:MM):');
                                   GotoXY(29,9);
                                   Readln(R_Res.Hora);
                                   Modificar_R(A_Res,Pos,R_Res);
                                   InterfazModificaciones;
                              End;
                     End;
               Until (Opc=#27);
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  La reserva esta dada de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  La reserva no existe');
          Readkey;
     End;
     Cerrar_R(A_Res);
End;

Procedure Consulta_Reserva(var A_Res:ArchivoReserva;var A_Pasaj:ArchivoPasajero;var A_Vue:ArchivoVuelo);
Var pos,cantidad, i,PunteroY,PunteroX:integer; Vec:TipoVectorReserva;
    R_Res:TipoReserva;   opc:char;
Begin
     Cargar_R(A_Res,Vec, cantidad);
     Burbuja_R(Vec, cantidad);
     Abrir_R(A_Res);
     Abrir_P(A_Pasaj);
     Abrir_VU(A_Vue);
     i:=1;
     opc:=#13;
     pos:=2;
     clrscr;
     InterfazConsultas;
     TextColor(white);
     TextBackground(0);
     GotoXY(2,2);
     PunteroY:=(4);
     Writeln('ID Reserva  |ID Vuelo |Costo |Fecha     |Hora  |DNI');
     While(i<=cantidad) and (opc<>#27) do
     Begin
		  PunteroX:=(2);
          TextColor(white);
          TextBackground(0);
          Leer_R(A_Res,R_Res,Vec[i].pos);
          GotoXY(PunteroX,PunteroY);
          Writeln(R_Res.ID_Reserva);
          PunteroX:=(PunteroX+12);
          GotoXY(PunteroX,PunteroY);
          Writeln('|',R_Res.ID_Vuelo);
          PunteroX:=(PunteroX+10);
          GotoXY(PunteroX,PunteroY);
          Writeln('|$',R_Res.Costo:2:2);
          PunteroX:=(PunteroX+7);
          GotoXY(PunteroX,PunteroY);
          Writeln('|',R_Res.Fecha:0);
          PunteroX:=(PunteroX+11);
          GotoXY(PunteroX,PunteroY);
          Writeln('|',R_Res.Hora);
          PunteroX:=(PunteroX+7);
          GotoXY(PunteroX,PunteroY);
          Writeln('| ',R_Res.ID_Pasajero);
          inc(pos);
          inc(i);
		  inc(PunteroY);
          If ((pos=26) or (i=cantidad+1)) then
          Begin
               TextColor(White);
               TextBackground(0);
               GotoXY(29,29);
               Writeln(' <- : Anterior | -> : Siguiente | Esc: Salir :');
               TextColor(white);
               TextBackground(0);
               Repeat
                     GotoXY(75,29);
                     opc:=readkey;
               Until  (opc=#27) or (opc=#75) or (opc=#77);
               If (opc=#75) and (i>=26) then
               begin
                    If (i>26) then
                       i:=i-26-(pos-3)
                    Else
                       i:=1;
                       pos:=2;
						clrscr;
						PunteroX:=(2);
						PunteroY:=(4);
						InterfazConsultas;
                       gotoxy(2,2);
                       TextColor(white);
                       TextBackground(0);
						Writeln('ID Reserva  |ID Vuelo |Costo |Fecha     |Hora  |DNI');
               end;
               If (opc='s') and (i<cantidad)then
               begin
                    pos:=2;
					clrscr;
					PunteroX:=(2);
					PunteroY:=(4);
					InterfazConsultas;
                    gotoxy(2,2);
                    TextColor(white);
                    TextBackground(0);
					Writeln('ID Reserva  |ID Vuelo |Costo |Fecha     |Hora  |DNI');
               end;
          end;
     end;
     Cerrar_R(A_Res);
     Cerrar_P(A_Pasaj);
     Cerrar_VU(A_Vue);
     Readkey;
End;


BEGIN
END.

