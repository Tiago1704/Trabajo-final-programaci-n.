Unit Unit_LineaAerea;

interface

Uses crt,sysutils,Unit_Validacion,Unit_Interfaz,Unit_Archivos;

Procedure Alta_Linea(var A_LA:ArchivoLineaAerea);
Procedure Baja_Linea(var A_LA:ArchivoLineaAerea);
Procedure Modificar_Linea(var A_LA:ArchivoLineaAerea);
Procedure Consulta_Linea(var A_LA:ArchivoLineaAerea);

Implementation


Procedure Alta_Linea(var A_LA:ArchivoLineaAerea);
Var Pos:integer;
    R_LA:TipoLineaAerea;
    Bus:string;
    Opc:char;
    ID_Aux:Integer;
    
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(27,5);
     Writeln('  Ingrese el nombre de la linea aerea que desea dar de alta:');
     GotoXY(15,9);
     Readln(Bus);
     Abrir_LA(A_LA);
     Busqueda_LA(A_LA,Bus,Pos,R_LA,ID_Aux);
     If (Pos=-1)then
     Begin
          TextColor(White);
          TextBackground(0);
          Clrscr;
          TextColor(12);
          TextBackground(0);
          InterfazPrincipal;
          GotoXY(23,5);
          Writeln('  Ingrese los datos para realizar el alta de la linea aerea');
		  // Validacion de ID.
		  R_LA.ID_LineaAerea:=(IntToStr(ID_Aux));
		  Validacion_ID_LA(A_LA,R_LA.ID_LineaAerea,R_LA);
		  // Carga de datos.
          GotoXY(15,9);
          Writeln('  El ID de la linea aerea sera: ',R_LA.ID_LineaAerea);
          GotoXY(15,10);
          Writeln('  Cuit(NN-NNNNNNNN-N):');
          GotoXY(37,10);
          Readln(R_LA.Cuit);
          GotoXY(15,11);
          Writeln('  Domicilio:');
          GotoXY(27,11);
          Readln(R_LA.Domicilio);
          R_LA.Activo:=True;
          R_LA.Nombre:=Bus;
          Guardar_LA(A_LA,R_LA);
          Cerrar_LA(A_LA);
          InterfazAltas;
     End
     Else
     Begin
          Leer_LA(A_LA,R_LA,Pos);
          Cerrar_LA(A_LA);
          If (R_LA.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(0);
                     Clrscr;
                     TextColor(12);
                     TextBackground(0);
                     InterfazPrincipal;
                     GotoXY(40,5);
                     Writeln('  La linea aerea ya fue dada de alta');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> ID Linea Aerea: ',R_LA.ID_LineaAerea);
                     GotoXY(31,11);
                     Writeln('> Nombre: ',R_LA.Nombre);
                     GotoXY(31,12);
                     Writeln('> Cuit: ',R_LA.Cuit);
                     GotoXY(31,13);
                     Writeln('> Domicilio: ',R_LA.Domicilio);
                     GotoXY(15,15);
                     Writeln('  Elija una opcion para seguir:');
                     GotoXY(45,16);
                     Writeln(' --> 1- Baja linea aerea');
                     GotoXY(45,17);
                     Writeln(' --> 2- Modificar linea aerea');
                     GotoXY(45,18);
                     Writeln(' --> Esc- Salir');
                     GotoXY(46,15);
                     Opc:=readkey;
                     Case (Opc) of
                         '1': Baja_Linea(A_LA);
                         '2': Modificar_Linea(A_LA);
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
                     Writeln('  La linea aerea esta dada de baja');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> ID Linea Aerea: ',R_LA.ID_LineaAerea);
                     GotoXY(31,11);
                     Writeln('> Nombre: ',R_LA.Nombre);
                     GotoXY(31,12);
                     Writeln('> Cuit: ',R_LA.Cuit);
                     GotoXY(31,13);
                     Writeln('> Domicilio: ',R_LA.Domicilio);
                     GotoXY(15,15);
                     Writeln('  Elija una opcion para seguir:');
                     GotoXY(45,16);
                     Writeln(' --> 1- Reactivarla');
                     GotoXY(45,17);
                     Writeln(' --> Esc- Salir');
                     GotoXY(46,15);
                     Opc:=readkey;
                     Case (Opc) of
                          '1':Begin
                                   TextColor(White);
                                   TextBackground(0);
                                   R_LA.Activo:=True;
                                   Abrir_LA(A_LA);
                                   Modificar_LA(A_LA,Pos,R_LA);
                                   Cerrar_LA(A_LA);
                                   InterfazReactivaciones;
                              End;
                     End;
               Until (Opc=#27);
          End;
     End;
End;

Procedure Baja_Linea(Var A_LA:ArchivoLineaAerea);
Var Bus:string;
    Pos:integer;
    R_LA:TipoLineaAerea;
    ID_Aux:integer;
    
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(15,5);
     Writeln('  Ingrese el nombre de la linea aerea que desea dar de baja:');
     GotoXY(75,5);
     Readln(Bus);
     Abrir_LA(A_LA);
     Busqueda_LA(A_LA,Bus,Pos,R_LA,ID_Aux);
     If (Pos<>-1) then
     Begin
          Leer_LA(A_LA,R_LA,Pos);
          If (R_LA.Activo=True) then
          Begin
               R_LA.Activo:=False;
               Modificar_LA(A_LA,Pos,R_LA);
               InterfazBajas;
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  La linea aerea ya esta dada de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  La linea aerea no existe');
          delay(1000);
          GotoXY(17,10);
		  Writeln('Oprima enter para continuar.');
          Readkey;
     End;
     Cerrar_LA(A_LA);
End;

Procedure Modificar_Linea(var A_LA:ArchivoLineaAerea);
Var Bus:string;
    Pos:integer;
    R_LA:TipoLineaAerea;
    Opc:char;
    ID_Aux:integer;
    
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(15,5);
     Writeln('  Ingrese el nombre de la linea aerea que desea modificar:');
     GotoXY(73,5);
     Readln(Bus);
     Abrir_LA(A_LA);
     Busqueda_LA(A_LA,Bus,Pos,R_LA,ID_Aux);
     If (Pos<>-1) then
     Begin
          Leer_LA(A_LA,R_LA,Pos);
          If (R_LA.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(0);
                     Clrscr;
                     TextColor(12);
                     TextBackground(0);
                     InterfazPrincipal;
                     GotoXY(40,5);
                     Writeln('  La linea aerea esta dada de alta');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> ID Linea Aerea: ',R_LA.ID_LineaAerea);
                     GotoXY(31,11);
                     Writeln('> Nombre: ',R_LA.Nombre);
                     GotoXY(31,12);
                     Writeln('> Cuit: ',R_LA.Cuit);
                     GotoXY(31,13);
                     Writeln('> Domicilio: ',R_LA.Domicilio);
                     GotoXY(15,15);
                     Writeln('  Elija el campo que desea modificar:');
                     GotoXY(52,16);
                     Writeln('--> 1- Nombre');
                     GotoXY(52,17);
                     Writeln('--> 2- Domicilio');
                     GotoXY(52,18);
                     Writeln('--> Esc- Salir');
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
                                   Writeln('  Nombre:');
                                   GotoXY(24,9);
                                   Readln(R_LA.Nombre);
                                   Modificar_LA(A_LA,Pos,R_LA);
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
                                   Writeln('  Domicilio:');
                                   GotoXY(27,9);
                                   Readln(R_LA.Domicilio);
                                   Modificar_LA(A_LA,Pos,R_LA);
                                   InterfazModificaciones;
                              End;
                     End;
               Until (Opc=#27);
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  La linea aerea esta dada de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  La linea aerea no existe');
          delay(1000);
          GotoXY(17,10);
		  Writeln('Oprima enter para continuar.');
          Readkey;
     End;
     Cerrar_LA(A_LA);
End;

Procedure Consulta_Linea(var A_LA:ArchivoLineaAerea);
Var Pos,cantidad,i,PunteroY,PunteroX:integer; Vec:TipoVectorLineaAerea;
    R_LA:TipoLineaAerea; opc:char;
Begin
     Cargar_LA(A_LA,Vec, cantidad);
     Burbuja_LA(Vec, cantidad);
     Abrir_LA(A_LA);
     i:=1;
     opc:=#13;
     Pos:=2;
     Clrscr;
     InterfazConsultas;
     TextColor(white);
     TextBackground(0);
     GotoXY(2,2);
     PunteroY:=(4);
     Writeln('ID Linea Aerea            |Nombre                   |Cuit                     | Domicilio');
     While(i<=cantidad) and (opc<>#27) do
     begin
		  PunteroX:=(2);
          TextColor(white);
          TextBackground(0);
          Leer_LA(A_LA,R_LA,Vec[i].pos);
          GotoXY(PunteroX,PunteroY);
          Writeln(R_LA.ID_LineaAerea);
          PunteroX:=(PunteroX+26);
          GotoXY(PunteroX,PunteroY);
          Writeln('| ',R_LA.Nombre);
          PunteroX:=(PunteroX+26);
          GotoXY(PunteroX,PunteroY);
          Writeln('| ',R_LA.Cuit);
          PunteroX:=(PunteroX+26);
          GotoXY(PunteroX,PunteroY);
          Writeln('| ',R_LA.Domicilio);
          inc(Pos);
          inc(i);
          Inc(PunteroY);
          If ((pos=26) or (i=cantidad+1)) then
          Begin
               TextColor(White);
               TextBackground(0);
               GotoXY(29,29);
               Writeln(' A: Anterior | S: Siguiente | Esc: Salir :');
               TextColor(12);
               TextBackground(0);
               Repeat
                     GotoXY(71,29);
                     opc:=readkey;
               Until  (opc=#27) or (opc=#75) or (opc=#77);
               If (opc=#75) and (i>=27) then
               begin
                    If (i>27) then
                       i:=i-27-(Pos-3)
                    Else
                       i:=1;
                       Pos:=2;
                       clrscr;
                       TextColor(12);
                       TextBackground(0);
                       gotoxy(1,1);
                       Writeln('ID Linea Aerea            |Nombre                   |Cuit                     | Domicilio');
               end;
               If (opc=#77) and (i<cantidad)then
               begin
					clrscr;
					PunteroX:=(2);
					PunteroY:=(4);
					InterfazConsultas;
					 Pos:=2;
                    clrscr;
                    TextColor(11);
                    TextBackground(0);
                    gotoxy(2,2);
                    Writeln('ID Linea Aerea            |Nombre                   |Cuit                     | Domicilio');
               end;
          end;
     end;
     Cerrar_LA(A_LA);
     Readkey;
End;


Begin
End.
