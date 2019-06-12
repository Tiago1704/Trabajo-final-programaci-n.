Unit Unit_Pasajero;

Interface

Uses crt,Unit_Interfaz,Unit_Archivos,Unit_Validacion;

Procedure Alta_Pasajero(var A_Pasaj:ArchivoPasajero);
Procedure Baja_Pasajero(var A_Pasaj:ArchivoPasajero);
Procedure Modificar_Pasajero(var A_Pasaj:ArchivoPasajero);
Procedure Consulta_Pasajero(var A_Pasaj:ArchivoPasajero);

Implementation

Procedure Alta_Pasajero(var A_Pasaj:ArchivoPasajero);
Var Pos:integer;
    R_Pasaj:TipoPasajero;
    Bus,PunteroY,PunteroX:LongInt;
    Opc:char;
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(35,5);
     Write('Ingrese el dni del pasajero que desea dar de alta:');
     //GotoXY(67,5);
     PunteroY:=(9);
     PunteroX:=(15);
     ValidacionDNI(Bus,PunteroY,PunteroX);
     Abrir_P(A_Pasaj);
     Busqueda_P(A_Pasaj,Bus,Pos,R_Pasaj);
     If (Pos=-1)then
     Begin
          TextColor(White);
          TextBackground(0);
          Clrscr;
          TextColor(12);
          TextBackground(0);
          InterfazPrincipal;
          GotoXY(35,5);
          Writeln('Ingrese los datos para realizar el alta del pasajero');
          GotoXY(15,9);
          Writeln('Apellido:');
          GotoXY(24,9);
          Readln(R_Pasaj.Apellido);
          GotoXY(15,12);
          Writeln('Nombre:');
          GotoXY(22,12);
          Readln(R_Pasaj.Nombre);
          GotoXY(15,15);
          inc(PunteroY);
          Writeln('Edad:');
          PunteroX:=(20);
          PunteroY:=(15);
          ValidacionEnteros2(R_Pasaj.Edad,PunteroY,PunteroX);
          R_Pasaj.Activo:=True;
          R_Pasaj.ID_Pasajero:=Bus;
          Guardar_P(A_Pasaj,R_Pasaj);
          
          InterfazAltas;
          clrscr;
          Cerrar_P(A_Pasaj);
     End
     Else
     Begin
          Leer_P(A_Pasaj,R_Pasaj,Pos);
          Cerrar_P(A_Pasaj);
          If (R_Pasaj.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(0);
                     Clrscr;
                     TextColor(12);
                     TextBackground(0);
                     InterfazPrincipal;
                     GotoXY(40,5);
                     Writeln('  El pasajero ya fue dado de alta');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> DNI: ',R_Pasaj.ID_Pasajero);
                     GotoXY(31,11);
                     Writeln('> Apellido: ',R_Pasaj.Apellido);
                     GotoXY(31,12);
                     Writeln('> Nombre: ',R_Pasaj.Nombre);
                     GotoXY(31,13);
                     Writeln('> Edad: ',R_Pasaj.Edad);
                     GotoXY(15,15);
                     Writeln('  Elija una opcion para seguir:');
                     GotoXY(45,16);
                     Writeln(' --> 1- Baja pasajero');
                     GotoXY(45,17);
                     Writeln(' --> 2- Modificar pasajero');
                     GotoXY(45,18);
                     Writeln(' --> Esc- Salir');
                     GotoXY(46,15);
                     Opc:=readkey;
                     Case (Opc) of
                          '1': Baja_Pasajero(A_Pasaj);
                          '2': Modificar_Pasajero(A_Pasaj);
                     End;
               Until (Opc=#27);
          End
          Else
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(0);
                     Clrscr;
                     TextColor(12);
                     TextBackground(0);
                     InterfazPrincipal;
                     GotoXY(40,5);
                     Writeln('  El pasajero esta dado de baja');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> DNI: ',R_Pasaj.ID_Pasajero);
                     GotoXY(31,11);
                     Writeln('> Apellido: ',R_Pasaj.Apellido);
                     GotoXY(31,12);
                     Writeln('> Nombre: ',R_Pasaj.Nombre);
                     GotoXY(31,13);
                     Writeln('> Edad: ',R_Pasaj.Edad);
                     GotoXY(15,15);
                     Writeln('  Elija una opcion para seguir:');
                     GotoXY(45,16);
                     Writeln(' --> 1- Reactivarlo');
                     GotoXY(45,17);
                     Writeln(' --> Esc- Salir');
                     GotoXY(46,15);
                     Opc:=readkey;
                     Case (Opc) of
                          '1':Begin
                                   TextColor(White);
                                   TextBackground(0);
                                   R_Pasaj.Activo:=True;
                                   Abrir_P(A_Pasaj);
                                   Modificar_P(A_Pasaj,Pos,R_Pasaj);
                                   Cerrar_P(A_Pasaj);
                                   InterfazReactivaciones;
                              End;
                     End;
               Until (Opc=#27);
          End;
     End;
End;

Procedure Baja_Pasajero(Var A_Pasaj:ArchivoPasajero);
Var Bus,PunteroY,PunteroX:LongInt;
    Pos:integer;
    R_Pasaj:TipoPasajero;
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(15,5);
     Writeln('Ingrese el dni del pasajero que desea dar de baja: ');
     PunteroY:=(5);
     PunteroX:=(66);
     ValidacionDNI(Bus,PunteroY,PunteroX);
     Abrir_P(A_Pasaj);
     Busqueda_P(A_Pasaj,Bus,Pos,R_Pasaj);
     If (Pos<>-1) then
     Begin
          Leer_P(A_Pasaj,R_Pasaj,Pos);
          If (R_Pasaj.Activo=True) then
          Begin
               R_Pasaj.Activo:=False;
               Modificar_P(A_Pasaj,Pos,R_Pasaj);
               InterfazBajas;
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('El pasajero ya esta dado de baja.');
			   gotoxy(15,10);
               Writeln('Oprima enter para continuar.');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('El pasajero no existe.');
          gotoxy(15,10);
          Writeln('Oprima enter para continuar.');
          Readkey;
     End;
     Cerrar_P(A_Pasaj);
End;

Procedure Modificar_Pasajero(var A_Pasaj:ArchivoPasajero);
Var Bus,PunteroY,PunteroX:LongInt;
    Pos:integer;
    R_Pasaj:TipoPasajero;
    Opc:char;
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(15,5);
     Writeln('  Ingrese el dni del pasajero que desea modificar:');
     PunteroY:=(5);
     GotoXY(65,5);
     ValidacionDNI(Bus,PunteroY,PunteroX);
     Abrir_P(A_Pasaj);
     Busqueda_P(A_Pasaj,Bus,Pos,R_Pasaj);
     If (Pos<>-1) then
     Begin
          Leer_P(A_Pasaj,R_Pasaj,Pos);
          If (R_Pasaj.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(0);
                     Clrscr;
                     TextColor(12);
                     TextBackground(0);
                     InterfazPrincipal;
                     GotoXY(40,5);
                     Writeln('  El pasajero esta dado de alta');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> DNI: ',R_Pasaj.ID_Pasajero);
                     GotoXY(31,11);
                     Writeln('> Apellido: ',R_Pasaj.Apellido);
                     GotoXY(31,12);
                     Writeln('> Nombre: ',R_Pasaj.Nombre);
                     GotoXY(31,13);
                     Writeln('> Edad: ',R_Pasaj.Edad);
                     GotoXY(15,15);
                     Writeln('  Elija el campo que desea modificar:');
                     GotoXY(52,16);
                     Writeln(' --> 1- Apellido');
                     GotoXY(52,17);
                     Writeln(' --> 2- Nombre');
                     GotoXY(52,18);
                     Writeln(' --> 3- Edad');
                     GotoXY(52,19);
                     Writeln(' --> Esc- Salir');
                     GotoXY(52,15);
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
                                   Writeln('  Apellido:');
                                   GotoXY(26,9);
                                   Readln(R_Pasaj.Apellido);
                                   Modificar_P(A_Pasaj,Pos,R_Pasaj);
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
                                   Writeln('  Nombre:');
                                   GotoXY(24,9);
                                   Readln(R_Pasaj.Nombre);
                                   Modificar_P(A_Pasaj,Pos,R_Pasaj);
                                   InterfazModificaciones;
                              End;
                          '3':Begin
                                   TextColor(White);
                                   TextBackground(0);
                                   Clrscr;
                                   TextColor(12);
                                   TextBackground(0);
                                   InterfazPrincipal;
                                   GotoXY(35,5);
                                   Writeln('Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('Edad:');
                                   PunteroX:=(22);
                                   PunteroY:=(9);
                                   ValidacionEnteros2(R_Pasaj.Edad,PunteroY,PunteroX);
                                   Modificar_P(A_Pasaj,Pos,R_Pasaj);
                                   InterfazModificaciones;
                              End;
                     End;
               Until (Opc=#27);
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('El pasajero esta dado de baja.');
               gotoxy(15,10);
               Writeln('Oprima enter para continuar.');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('El pasajero no existe.');
          gotoxy(15,10);
          Writeln('Oprima enter para continuar.');
          Readkey;
     End;
     Cerrar_P(A_Pasaj);
End;

Procedure Consulta_Pasajero(var A_Pasaj:ArchivoPasajero);
Var Pos,cantidad, i,PunteroY,PunteroX:integer; Vec:TipoVectorPasajero;
    R_Pasaj:TipoPasajero; opc:char;
Begin
     Cargar_P(A_Pasaj,Vec, cantidad);
     Burbuja_P(Vec, cantidad);
     Abrir_P(A_Pasaj);
     i:=1;
     opc:=#13;
     Pos:=2;
     clrscr;
	 InterfazConsultas;
     TextColor(white);
     TextBackground(0);
     GotoXY(2,2);
     PunteroY:=(4);
     Writeln('Apellido                  |Nombre                    |DNI                       | Edad');
     While(i<=cantidad) and (opc<>#27) do
     Begin
		  PunteroX:=(2);
          TextColor(white);
          TextBackground(0);
          Leer_P(A_Pasaj,R_Pasaj,Vec[i].pos);
          GotoXY(PunteroX,PunteroY);
          Writeln(R_Pasaj.Apellido);
          PunteroX:=(PunteroX+26);
          GotoXY(PunteroX,PunteroY);
          Writeln('| ',R_Pasaj.Nombre);
          PunteroX:=(PunteroX+26);
          GotoXY(PunteroX,PunteroY);
          Writeln('| ',R_Pasaj.ID_Pasajero);
          PunteroX:=(PunteroX+26);
          GotoXY(PunteroX,PunteroY);
          Writeln('| ',R_Pasaj.Edad);
          inc(Pos);
          inc(i);
          Inc(PunteroY);
          If ((Pos=26) or (i=cantidad+1)) then
          Begin
               TextColor(White);
               TextBackground(0);
               GotoXY(29,29);
               Writeln(' <- : Anterior | -> : Siguiente | Esc: Salir :');
               TextColor(11);
               TextBackground(0);
               Repeat
                     GotoXY(75,29);
                     opc:=readkey;
               Until  (opc=#27) or (opc=#75) or (opc=#77);
               If (opc=#75) and (i>=27) then
               begin
                    If (i>26) then
                       i:=i-26-(Pos-3)
                    Else
						clrscr;
						PunteroX:=(2);
						PunteroY:=(4);
						InterfazConsultas;
                       i:=1;
                       Pos:=2;
                       clrscr;
                       TextColor(12);
                       TextBackground(0);
                       gotoxy(2,2);     
					   Writeln('Apellido                  |Nombre                    |DNI                       | Edad');               
					end;
               If (opc=#77) and (i<cantidad)then
               begin
					clrscr;
					PunteroX:=(2);
					PunteroY:=(4);
					InterfazConsultas;
                    pos:=2;
                    clrscr;
                    TextColor(12);
                    TextBackground(0);
                    gotoxy(2,2);					   
					Writeln('Apellido                  |Nombre                    |DNI                       | Edad');   
               end;
          end;
     End;
     Cerrar_P(A_Pasaj);
     Readkey;
End;

Begin
End.
