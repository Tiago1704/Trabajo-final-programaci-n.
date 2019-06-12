Unit Unit_Aeropuerto;

interface

Uses crt,sysutils,Unit_Archivos,Unit_Interfaz,Unit_Validacion;

Procedure Alta_Aeropuerto(var A_Aero:ArchivoAeropuerto);
Procedure Baja_Aeropuerto(Var A_Aero:ArchivoAeropuerto);
Procedure Modificar_Aeropuerto(Var A_Aero:ArchivoAeropuerto);
Procedure Consulta_Aeropuerto(Var A_Aero:ArchivoAeropuerto);

implementation


Procedure Alta_Aeropuerto(var A_Aero:ArchivoAeropuerto);
Var Pos:integer;
    R_Aero:TipoAeropuerto;
    Bus:string;
    Opc:char;
    ID_Aux:integer;
    
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(32,5);
     Writeln('  Ingrese el nombre del aeropuerto que desea dar de alta:');
     GotoXY(15,9);
     Readln(Bus);
     Abrir_A(A_Aero);
     Busqueda_A(A_Aero,Pos,Bus,R_Aero,ID_Aux);
     If (Pos=-1)then
     Begin
          TextColor(White);
          TextBackground(0);
          Clrscr;
          TextColor(12);
          TextBackground(0);
          InterfazPrincipal;
          GotoXY(30,5);
          Writeln('  Ingrese los datos para realizar el alta del aeropuerto');
          (R_Aero.ID_Aeropuerto):=(IntToStr(ID_Aux));
          Validacion_ID_A(A_Aero,R_Aero.ID_Aeropuerto,R_Aero);
          GotoXY(15,9);
          Writeln('  El ID del aeropuerto sera: ',R_Aero.ID_Aeropuerto);
          GotoXY(15,10);
          Writeln('  Ciudad:');
          GotoXY(24,10);
          Readln(R_Aero.Ciudad);
          GotoXY(15,11);
          Writeln('  Pais:');
          GotoXY(22,11);
          Readln(R_Aero.Pais);
          R_Aero.Activo:=True;
          R_Aero.Nombre:=Bus;
          Guardar_A(A_Aero,R_Aero);
          InterfazAltas;
          Cerrar_A(A_Aero);
     End
     Else
     Begin
          Leer_A(A_Aero,R_Aero,Pos);
          Cerrar_A(A_Aero);
          If (R_Aero.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(0);
                     Clrscr;
                     TextColor(12);
                     TextBackground(0);
                     InterfazPrincipal;
                     GotoXY(40,5);
                     Writeln('  El aeropuerto ya fue dado de alta');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> ID Aeropuerto: ',R_Aero.ID_Aeropuerto);
                     GotoXY(31,11);
                     Writeln('> Nombre: ',R_Aero.Nombre);
                     GotoXY(31,12);
                     Writeln('> Pais: ',R_Aero.Pais);
                     GotoXY(31,13);
                     Writeln('> Ciudad: ',R_Aero.Ciudad);
                     GotoXY(15,15);
                     Writeln('  Elija una opcion para seguir:');
                     GotoXY(45,16);
                     Writeln(' --> 1- Baja aeropuerto');
                     GotoXY(45,17);
                     Writeln(' --> 2- Modificar aeropuerto');
                     GotoXY(45,18);
                     Writeln(' --> Esc- Salir');
                     GotoXY(46,15);
                     Opc:=readkey;
                     Case (Opc) of
                          '1': Baja_Aeropuerto(A_Aero);
                          '2': Modificar_Aeropuerto(A_Aero);
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
                     Writeln('  El aeropuerto esta dado de baja');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> ID Aeropuerto: ',R_Aero.ID_Aeropuerto);
                     GotoXY(31,11);
                     Writeln('> Nombre: ',R_Aero.Nombre);
                     GotoXY(31,12);
                     Writeln('> Pais: ',R_Aero.Pais);
                     GotoXY(31,13);
                     Writeln('> Ciudad: ',R_Aero.Ciudad);
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
                                   R_Aero.Activo:=True;
                                   Abrir_A(A_Aero);
                                   Modificar_A(A_Aero,Pos,R_Aero);
                                   Cerrar_A(A_Aero);
                                   InterfazReactivaciones;
                              End;
                     End;
               Until (Opc=#27);
          End;
     End;
End;


Procedure Baja_Aeropuerto(Var A_Aero:ArchivoAeropuerto);
Var Bus:string;
    Pos:integer;
    R_Aero:TipoAeropuerto;
    ID_Aux:integer;
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(15,5);
     Writeln('  Ingrese el nombre del aeropuerto que desea dar de baja:');
     GotoXY(72,5);
     Readln(Bus);
     Abrir_A(A_Aero);
     Busqueda_A(A_Aero,Pos,Bus,R_Aero,ID_Aux);
     If (Pos<>-1) then
     Begin
          Leer_A(A_Aero,R_Aero,Pos);
          If (R_Aero.Activo=True) then
          Begin
               R_Aero.Activo:=False;
               Modificar_A(A_Aero,Pos,R_Aero);
               InterfazBajas;
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('El aeropuerto ya esta dado de baja.');
               GotoXY(15,10);
			   Writeln('Oprima enter para continuar.');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('El aeropuerto no existe.');
          GotoXY(15,10);
          Writeln('Oprima enter para continuar.');
          Readkey;
     End;
     Cerrar_A(A_Aero);
End;

Procedure Modificar_Aeropuerto(var A_Aero:ArchivoAeropuerto);
Var Bus:string;
    Pos:integer;
    R_Aero:TipoAeropuerto;
    Opc:char;
    ID_Aux:Integer;
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(32,5);
     Writeln('  Ingrese el nombre del aeropuerto que desea modificar:');
     GotoXY(70,5);
     Readln(Bus);
     Abrir_A(A_Aero);
     Busqueda_A(A_Aero,Pos,Bus,R_Aero,ID_Aux);
     If (Pos<>-1) then
     Begin
          Leer_A(A_Aero,R_Aero,Pos);
          If (R_Aero.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(0);
                     Clrscr;
                     TextColor(12);
                     TextBackground(0);
                     InterfazPrincipal;
                     GotoXY(40,5);
                     Writeln('  El aeropuerto esta dado de alta');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> ID Aeropuerto: ',R_Aero.ID_Aeropuerto);
                     GotoXY(31,11);
                     Writeln('> Nombre: ',R_Aero.Nombre);
                     GotoXY(31,12);
                     Writeln('> Pais: ',R_Aero.Pais);
                     GotoXY(31,13);
                     Writeln('> Ciudad: ',R_Aero.Ciudad);
                     GotoXY(15,15);
                     Writeln('  Elija el campo que desea modificar:');
                     GotoXY(52,16);
                     Writeln('--> 1- Nombre');
                     GotoXY(52,17);
                     Writeln('--> 2- Ciudad');
                     GotoXY(52,18);
                     Writeln('--> 3- Pais');
                     GotoXY(52,19);
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
                                   Readln(R_Aero.Nombre);
                                   Modificar_A(A_Aero,Pos,R_Aero);
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
                                   Writeln('  Ciudad:');
                                   GotoXY(31,9);
                                   Readln(R_Aero.Ciudad);
                                   Modificar_A(A_Aero,Pos,R_Aero);
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
                                   Writeln('  Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('  Pais:');
                                   GotoXY(31,9);
                                   Readln(R_Aero.Pais);
                                   Modificar_A(A_Aero,Pos,R_Aero);
                                   InterfazModificaciones;
                              End;
                     End;
               Until (Opc=#27);
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('El aeropuerto esta dado de baja');
               GotoXY(15,10);
			   Writeln('Oprima enter para continuar.');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('El aeropuerto no existe');
          GotoXY(15,10);
          Writeln('Oprima enter para continuar.');
          readkey;
     End;
     Cerrar_A(A_Aero);
End;

Procedure Consulta_Aeropuerto(var A_Aero:ArchivoAeropuerto);
Var pos,cantidad,i,PunteroX,PunteroY :integer; Vec:TipoVectorAero;
    R_Aero:TipoAeropuerto;   opc:char;
Begin
     Cargar_A(A_Aero,Vec, cantidad);
     Burbuja_A(Vec, cantidad);
     Abrir_A(A_Aero);
     i:=1;
     opc:=#13;
     pos:=2;
     Clrscr;
     InterfazConsultas;
     TextColor(white);
     TextBackground(0);
     GotoXY(2,2);
     PunteroY:=(4);
     Writeln('ID Aeropuerto             |Nombre                   |Ciudad                    | Pais');
     While (i<=cantidad) and (opc<>#27) do
     Begin
		  PunteroX:=(2);
          TextColor(white);
          TextBackground(0);
          Leer_A(A_Aero,R_Aero,Vec[i].pos);
          GotoXY(PunteroX,PunteroY);
          Writeln(R_Aero.ID_Aeropuerto);
          PunteroX:=(PunteroX+26);
          GotoXY(PunteroX,PunteroY);
          Writeln('| ',R_Aero.Nombre);
          PunteroX:=(PunteroX+26);
          GotoXY(PunteroX,PunteroY);
          Writeln('| ',R_Aero.Ciudad);
          PunteroX:=(PunteroX+26);
          GotoXY(PunteroX,PunteroY);
          Writeln('| ',R_Aero.Pais);
          inc(pos);
          inc(i);
          Inc(PunteroY);
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
               If (cantidad>0) and (opc=#75) and (i>=27) then
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
                       TextColor(11);
                       TextBackground(0);
                       GotoXY(2,2);
                       Writeln('ID Aeropuerto             |Nombre                   |Ciudad                   | Pais');
               end;
               If (cantidad>0) and (opc=#77) and (i<cantidad)then
               begin
					clrscr;
					PunteroX:=(2);
					PunteroY:=(4);
					InterfazConsultas;
                    pos:=2;
                    TextColor(white);
                    TextBackground(0);
                    GotoXY(2,2);
                    Writeln('ID Aeropuerto             |Nombre                   |Ciudad                    | Pais');
               end;
          end;
     end;
     Cerrar_A(A_Aero);
     Readkey;
End;

Begin
End.
