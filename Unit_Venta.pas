Unit Unit_Venta;

Interface

Uses crt,Unit_Archivos,Unit_Interfaz,Unit_Pasajero,Unit_Validacion;

Procedure Alta_Venta(var A_Ven:ArchivoVenta;var A_Pasaj:ArchivoPasajero);
Procedure Baja_Venta(var A_Ven:ArchivoVenta);
Procedure Modificar_Venta(var A_Ven:ArchivoVenta);
Procedure Consulta_Venta(var A_Ven:ArchivoVenta;var A_Pasaj:ArchivoPasajero);

Implementation

Procedure Alta_Venta(var A_Ven:ArchivoVenta;var A_Pasaj:ArchivoPasajero);
Var Pos1:integer;
    R_Ven:TipoVenta;
    R_Pasaj:TipoPasajero;
    Opc1:char;
    PunteroY,PunteroX:LongInt;
    
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     Abrir_VE(A_Ven);
     GotoXY(26,5);
     Writeln('Presione Enter para ingresar los datos del alta de la venta');
     readkey();
     GotoXY(15,9);
     Write('Ingrese el costo: $');
     PunteroY:=(9);
     PunteroX:=(15+20);     
     ValidacionReales(R_Ven.Costo,PunteroY,PunteroX);
     Inc(PunteroY);
	 GotoXY(15,PunteroY);
     Write('Ingrese la fecha de reserva: ');
     PunteroX:=(15);
     Inc(PunteroY);
     ValidacionFecha(R_Ven.Fecha,PunteroY,PunteroX);
     Inc(PunteroY);
     PunteroX:=(15);
     GotoXY(15,PunteroY);
     Writeln('Ingrese la hora reserva: ');
     ValidacionHora(R_Ven.Hora,PunteroY,PunteroX);
     Pos1:=-1;
     Repeat
		   GotoXY(15,PunteroY);
		   Write('Ingrese su DNI: ');
		   PunteroX:=(15 +16);
		   ValidacionDNI(R_Ven.ID_Pasajero,PunteroY,PunteroX);
           Abrir_P(A_Pasaj);
           Busqueda_P(A_Pasaj,R_Ven.ID_Pasajero,Pos1,R_Pasaj);
           Cerrar_P(A_Pasaj);
           If (Pos1<>-1) then
           Begin
				clrscr;
           End
           Else
           Begin
                Repeat
                GotoXY(15,PunteroY);
                Writeln('El pasajero ',R_Ven.ID_Pasajero,' no se encuentra registrado. Oprima:');
                Inc(PunteroY);
                GotoXY(15,PunteroY);
                Writeln('Borrar/Backspace: ingresar de nuevo | Enter: dar de alta');
                Opc1:=readkey;
                Until (Opc1=#08) or (Opc1=#13);
                If(Opc1=#08) then
                Begin
					clrscr;
                End
                Else
                Begin
					clrscr;
                    alta_Pasajero(A_Pasaj);
                    Abrir_P(A_Pasaj);
                    Busqueda_P(A_Pasaj,R_Ven.ID_Pasajero,Pos1,R_Pasaj);
                    Cerrar_P(A_Pasaj);
                    TextColor(green);
                    TextBackground(0);
                    clrscr;
                    Writeln('El DNI ',R_Ven.ID_Pasajero,' fue cargado con exito.');
                    Writeln('Alta de venta concretada.');
                    WriteLn('Oprima "Enter/Intro" para continuar.');
					readkey;
                    TextColor(12);
                    TextBackground(0);
                    InterfazPrincipal;
                End;
           End;
     Until (Pos1<>-1);
     R_Ven.Activo:=True;
     R_Ven.ID_Venta:=(Filesize(A_Ven)+1);
     Guardar_VE(A_Ven,R_Ven);
     Cerrar_VE(A_Ven);
	 textcolor(white);
	 window(1,1,105,51);
     clrscr;
     InterfazAltas;
     Readkey;
End;

Procedure Baja_Venta(Var A_Ven:ArchivoVenta);
Var Bus:integer;
    Pos:integer;
    R_Ven:TipoVenta;
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(15,5);
     Writeln('  Ingrese el codigo de venta que desea dar de baja:');
     GotoXY(66,5);
     Readln(Bus);
     Abrir_VE(A_Ven);
     Busqueda_VE(A_Ven,Bus,Pos,R_Ven);
     If (Pos<>-1) then
     Begin
          Leer_VE(A_Ven,R_Ven,Pos);
          If (R_Ven.Activo=True) then
          Begin
               R_Ven.Activo:=False;
               Modificar_VE(A_Ven,Pos,R_Ven);
               InterfazBajas;
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  La venta ya esta dada de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  La venta no existe');
          Readkey;
     End;
     Cerrar_VE(A_Ven);
End;

Procedure Modificar_Venta(var A_Ven:ArchivoVenta);
Var Bus:integer;
    Pos:integer;
    R_Ven:TipoVenta;
    Opc:char;
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(15,5);
     Writeln('  Ingrese el codigo de la venta que desea modificar:');
     GotoXY(67,5);
     Readln(Bus);
     Abrir_VE(A_Ven);
     Busqueda_VE(A_Ven,Bus,Pos,R_Ven);
     If (Pos<>-1) then
     Begin
          Leer_VE(A_Ven,R_Ven,Pos);
          If (R_Ven.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(0);
                     Clrscr;
                     TextColor(12);
                     TextBackground(0);
                     InterfazPrincipal;
                     GotoXY(40,5);
                     Writeln('  La venta esta dada de alta');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> ID Venta: ',R_Ven.ID_Venta);
                     GotoXY(31,11);
                     Writeln('> ID Pasajero: ',R_Ven.ID_Pasajero);
                     GotoXY(31,12);
                     Writeln('> Costo: ',R_Ven.Costo:2:2);
                     GotoXY(31,13);
                     Writeln('> Fecha: ',R_Ven.Fecha:0);
                     GotoXY(31,14);
                     Writeln('> Hora: ',R_Ven.Hora);
                     GotoXY(15,16);
                     Writeln('  Elija el campo que desea modificar:');
                     GotoXY(52,17);
                     Writeln('--> 1- Fecha');
                     GotoXY(52,18);
                     Writeln('--> 2- Hora');
                     GotoXY(52,19);
                     Writeln('--> Esc- Salir');
                     GotoXY(52,16);
                     Opc:=readkey;
                     Case Opc of
                          '1':Begin
                                   TextColor(White);
                                   TextBackground(0);
                                   Clrscr;
                                   TextColor(12);
                                   TextBackground(0);
                                   InterfazPrincipal;
                                   GotoXY(35,5);
                                   Writeln('  Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('  Fecha(DD/MM/AAAA):');
                                   GotoXY(35,9);
                                   Readln(R_Ven.Fecha);
                                   Modificar_VE(A_Ven,Pos,R_Ven);
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
                                   Readln(R_Ven.Hora);
                                   Modificar_VE(A_Ven,Pos,R_Ven);
                                   InterfazModificaciones;
                              End;
                     End;
               Until (Opc=#27);
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  La venta esta dada de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  La venta no existe');
          Readkey;
     End;
     Cerrar_VE(A_Ven);
End;

Procedure Consulta_Venta(var A_Ven:ArchivoVenta;var A_Pasaj:ArchivoPasajero);
Var pos,cantidad, i,PunteroX,PunteroY:integer; Vec:TipoVectorVenta;
    R_Ven:TipoVenta;   opc:char;
Begin
     Cargar_VE(A_Ven,Vec, cantidad);
     Burbuja_VE(Vec, cantidad);
     Abrir_VE(A_Ven);
     Abrir_P(A_Pasaj);
     i:=1;
     opc:=#13;
     pos:=2;
     clrscr;
     InterfazConsultas;
     TextColor(white);
     TextBackground(0);
     GotoXY(2,2);
     PunteroY:=(4);
     Writeln('ID Venta |Costo    |Fecha      |Hora  |DNI');
     While(i<=cantidad) and (opc<>#27) do
     Begin
		  PunteroX:=(2);
          TextColor(white);
          TextBackground(0);
          Leer_VE(A_Ven,R_Ven,Vec[i].pos);
          GotoXY(PunteroX,PunteroY);
          Writeln(R_Ven.ID_Venta);
          PunteroX:=(PunteroX+9);
          GotoXY(PunteroX,PunteroY);
          Writeln('|$',R_Ven.Costo:2:2);
          PunteroX:=(PunteroX+10);
          GotoXY(PunteroX,PunteroY);
          Writeln('|',R_Ven.Fecha:0);
          PunteroX:=(PunteroX+12);
          GotoXY(PunteroX,PunteroY);
          Writeln('|',R_Ven.Hora);
          PunteroX:=(PunteroX+7);
          GotoXY(PunteroX,PunteroY);
          Writeln('|',R_Ven.ID_Pasajero);
          inc(pos);
          inc(i);
		  Inc(PunteroY);
          If ((pos=26) or (i=cantidad+1)) then
          Begin
               TextColor(White);
               TextBackground(0);
               GotoXY(1,29);
               Writeln('<- : Anterior | -> : Siguiente | Esc: Salir :');
               TextColor(white);
               TextBackground(0);
               Repeat
                     GotoXY(42,29);
                     opc:=readkey;
               Until  (opc=#27) or (opc=#75) or (opc=#77);
               If (opc=#75) and (i>=26) then
               begin
                    If (i>26) then
                       i:=i-26-(pos-3)
                    Else
						clrscr;
						PunteroX:=(2);
						PunteroY:=(4);
						InterfazConsultas;
                       i:=1;
                       pos:=2;
                       clrscr;
                       gotoxy(1,1);
                       TextColor(12);
                       TextBackground(0);
						Writeln('ID Venta |Costo    |Fecha      |Hora  |DNI');
               end;
               If (opc=#77) and (i<cantidad)then
               begin
					clrscr;
					PunteroX:=(2);
					PunteroY:=(4);
					InterfazConsultas;
                    pos:=2;
                    clrscr;
                    gotoxy(2,2);
                    TextColor(white);
                    TextBackground(0);
					Writeln('ID Venta |Costo    |Fecha      |Hora  |DNI');
               end;
          end;
     end;
     Cerrar_VE(A_Ven);
     Cerrar_P(A_Pasaj);
     Readkey;
End;

Begin
End.
