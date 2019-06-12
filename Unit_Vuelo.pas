Unit Unit_Vuelo;

Interface

Uses crt,Unit_Interfaz,Unit_Archivos,Unit_Aeropuerto,Unit_LineaAerea,Unit_Validacion;

Procedure Alta_Vuelo(var A_Vue:ArchivoVuelo;var A_Aero:ArchivoAeropuerto;var A_LA:ArchivoLineaAerea);
Procedure Baja_Vuelo(Var A_Vue:ArchivoVuelo);
Procedure Modificar_Vuelo(var A_Vue:ArchivoVuelo);
Procedure Consulta_Vuelo(var A_Vue:ArchivoVuelo;var A_Aero:ArchivoAeropuerto;var A_LA:ArchivoLineaAerea);


Implementation


Procedure Alta_Vuelo(var A_Vue:ArchivoVuelo;var A_Aero:ArchivoAeropuerto;var A_LA:ArchivoLineaAerea);
var Escala:string;
    Opc1,Opc2,Opc3:char;   
    C,Pos1,Pos2,Pos3,j,x,ID_Aux:integer;  
    PunteroY,PunteroX,Aux:LongInt;
    R_Vue:TipoVuelo;
    R_Aero:TipoAeropuerto;
    R_LA:TipoLineaAerea;
Begin
	TextColor(White);
	TextBackground(0);
	Clrscr;
	TextColor(12);
	TextBackground(0);
	InterfazPrincipal;
	Abrir_VU(A_Vue);
	GotoXY(36,5);
	Writeln('Ingrese los datos para realizar el alta del vuelo ');
	Pos1:=-1;
	Repeat
		GotoXY(15,9);
		Writeln('Aeropuerto de origen: ');
		GotoXY(36,9);
		Readln(R_Vue.Origen);
		Abrir_A(A_Aero);
		Busqueda_A(A_Aero,Pos1,R_Vue.Origen,R_Aero,ID_Aux);
		Cerrar_A(A_Aero);
		If (Pos1<>-1) then
		Begin
			Abrir_A(A_Aero);
			R_Vue.Origen:=R_Aero.ID_Aeropuerto;
			Cerrar_A(A_Aero);
		End
			Else
			Begin
			Repeat
				GotoXY(15,11);
				Writeln('El aeropuerto ingresado no esta dado de alta, Oprima:');
				GotoXY(15,12);
				Writeln('Borrar/Backspace: ingresar de nuevo | Enter: dar de alta');
				Opc1:=readkey;
				Until (Opc1=#08) or (Opc1=#13);
			If(Opc1=#08) then
			Begin
				
				InterfazPrincipal;
			End
				Else
				Begin
					Alta_Aeropuerto(A_Aero);
					Abrir_A(A_Aero);
					Busqueda_A(A_Aero,Pos1,R_Vue.Origen,R_Aero,ID_Aux);
					Cerrar_A(A_Aero);
					TextColor(White);
					TextBackground(0);
					clrscr;
					TextColor(12);
					TextBackground(0);
					
				End;
        End;
		Until (Pos1<>-1);
		PunteroY:=(11);
		PunteroX:=(15);
		ValidacionFecha(R_Vue.FechaP,PunteroY,PunteroX);
		ValidacionHora(R_Vue.HoraP,PunteroY,PunteroX);
		GotoXY(15,PunteroY);
		Writeln('Presione enter para ingresar datos de destino');
		readkey();
		Pos2:=-1;
		Repeat
			clrscr;
			InterfazPrincipal;
			GotoXY(37,5);
			Write('Datos del aeropuerto de destino:');
			GotoXY(15,9);
			Write('Aeropuerto de destino:');
			Readln(R_Vue.Destino);
			Abrir_A(A_Aero);
			Busqueda_A(A_Aero,Pos2,R_Vue.Destino,R_Aero,ID_Aux);
			Cerrar_A(A_Aero);
			If (Pos2<>-1) then
			Begin
				Abrir_A(A_Aero);
                R_Vue.Destino:=R_Aero.ID_Aeropuerto;
                Cerrar_A(A_Aero);
			End
				Else
				Begin
                Repeat
				GotoXY(15,11);
				Writeln('El aeropuerto ingresado no esta dado de alta, Oprima:');
				GotoXY(15,12);
				Writeln('Borrar/Backspace: ingresar de nuevo | Enter: dar de alta');
				Opc2:=readkey;
				Until (Opc2=#08) or (Opc2=#13);
			If(Opc2=#08) then
			Begin
				clrscr;
				InterfazAux;
			End
                Else
                Begin
                     Alta_Aeropuerto(A_Aero);
                     Abrir_A(A_Aero);
                     Busqueda_A(A_Aero,Pos2,R_Vue.Destino,R_Aero,ID_Aux);
                     Cerrar_A(A_Aero);
                     TextColor(White);
                     TextBackground(0);
                     
                     TextColor(12);
                     TextBackground(0);
                     InterfazPrincipal;
                     GotoXY(15,9);
                     Writeln('Aeropuerto de destino:');
                End;
          End;
     Until (Pos2<>-1);
     GotoXY(15,10);
     Writeln('Fecha de llegada a destino');
     PunteroX:=(15);
     PunteroY:=(11);
     ValidacionFecha(R_Vue.FechaL,PunteroY,PunteroX);
     GotoXY(15,17);
     Write('Hora de llegada');
     PunteroX:=(15);
     PunteroY:=(18);
     ValidacionHora(R_Vue.HoraL,PunteroY,PunteroX);
     clrscr;
     InterfazAux;
     clrscr;
     InterfazAux;
     Escala:=('');
     GotoXY(15,9);
	 Writeln('Si desea ingresar escalas puede hacerlo a continuacion (maximo 3).');
	 GotoXY(15,10);
     WriteLN('Caso contrario, oprima enter para continuar. ');
     GotoXY(15,11);
     Write('Escala: ');
     Readln(Escala);
     x:=11;
     C:=0;
     for j:=1 to 3 do
         R_Vue.Escalas[j]:='';
     While (Escala<>'') and (C<=3) do
     begin
          Inc(C);
          R_Vue.Escalas[C]:=Escala;
          Inc(x);
          GotoXY(15,x);
          If (C<3) then
          Begin
               Writeln('Ingrese otra escala: ');
               GotoXY(36,x);
               Readln(Escala);
          end
          Else
          Begin
               x:=11;
          End;
     End;
     inc(x);
     clrscr;
     InterfazAux;
     Pos3:=-1;
     inc(x);
     Repeat
		   GotoXY(15,9);
		   Write('Ingrese la linea aerea:');
           Readln(R_Vue.ID_LineaAerea);
           Abrir_LA(A_LA);
           Busqueda_LA(A_LA,R_Vue.ID_LineaAerea,Pos3,R_LA,ID_Aux);
           Cerrar_LA(A_LA);
           If (Pos3<>-1) then
           Begin
                Abrir_LA(A_LA);
                R_Vue.ID_LineaAerea:=R_LA.ID_LineaAerea;
                Cerrar_LA(A_LA);
                
           End
           Else
           Begin
                Repeat
				GotoXY(15,11);
				Writeln('La linea aerea ingresada no esta dada de alta, Oprima:');
				GotoXY(15,12);
				Writeln('Borrar/Backspace: ingresar de nuevo | Enter: dar de alta');
				Opc3:=readkey;
				Until (Opc3=#08) or (Opc3=#13);
			If(Opc3=#08) then
			Begin
				clrscr;
				InterfazAux;
			End
                Else
                Begin
                     Alta_Linea(A_LA);
                     Abrir_LA(A_LA);
                     Busqueda_LA(A_LA,R_Vue.ID_LineaAerea,Pos3,R_LA,ID_Aux);
                     Cerrar_LA(A_LA);
                     TextColor(White);
                     TextBackground(0);
                     
                     TextColor(12);
                     TextBackground(0);
                     InterfazPrincipal;
                     GotoXY(15,9);
                     Writeln('Ingrese la linea aerea:');
                End;
          End;
     Until (Pos3<>-1);
     inc(x);
     clrscr;
     InterfazAux;
     GotoXY(15,9);
     Write('Ingrese la cantidad de pasajeros: ');
     PunteroX:=(15+34); //15 de X es el origen de todos los texto + 34 caracteres del texto.
	 PunteroY:=(9);
	 ValidacionEnteros(R_Vue.Cant_Pasajeros,PunteroY,PunteroX);
	 clrscr;
	 InterfazPrincipal;
     inc(x);
     GotoXY(15,PunteroY);
     Writeln('Seleccione el estado del vuelo: ');
     Inc(PunteroY);
     GotoXY(15,PunteroY);
     Writeln('1) Lleno.');
	 Inc(PunteroY);
     GotoXY(15,PunteroY);
     Writeln('2) Disponible.');
	 Inc(PunteroY);
	 GotoXY(15,PunteroY);
     Writeln('3) Vacio.');
     Aux:=(0);
     while ((Aux<1) or (Aux>3)) do
     begin
		 PunteroX:=(PunteroX+32);
		 PunteroY:=(PunteroY-3);
		 GotoXY(PunteroX,PunteroY);
		 ValidacionEnteros2(Aux,PunteroY,PunteroX);
		 Case (Aux) of
			   1: R_Vue.Estado:=('Lleno');
			   2: R_Vue.Estado:=('Disponible');
			   3: R_Vue.Estado:=('Vacio');
			  End;
		 Inc(PunteroY);
		 DesfaceVertical(PunteroY);
	 end;
     R_Vue.Activo:=True;
     R_Vue.ID_Vuelo:=(Filesize(A_Vue)+1);
     Guardar_VU(A_Vue,R_Vue);
     Cerrar_VU(A_Vue);
     clrscr;
     InterfazAux;
     InterfazAltas;
End;

Procedure Baja_Vuelo(Var A_Vue:ArchivoVuelo);
Var 
    Pos:integer;
    Bus,PunteroY,PunteroX:LongInt;
    R_Vue:TipoVuelo;
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(15,5);
     Writeln('  Ingrese el ID del vuelo que desea dar de baja:');
     PunteroX:=(63);
     PunteroY:=(5);
     ValidacionEnteros2(Bus,PunteroY,PunteroX);
     Abrir_VU(A_Vue);
     Busqueda_VU(A_Vue,Bus,Pos,R_Vue);
     If (Pos<>-1) then
     Begin
          Leer_VU(A_Vue,R_Vue,Pos);
          If (R_Vue.Activo=True) then
          Begin
               R_Vue.Activo:=False;
               Modificar_VU(A_Vue,Pos,R_Vue);
               InterfazBajas;
          End
          Else
          Begin
               GotoXY(15,9);
			   textcolor(green);
               Writeln('El vuelo ya esta dado de baja.');
               Writeln('Oprima enter para continuar.');
               textcolor(white);
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          textcolor(green);
          Writeln('El vuelo no existe.');
          Writeln('Oprima enter para continuar');
          textcolor(white);
          Readkey;
     End;
     Cerrar_VU(A_Vue);
End;

Procedure Modificar_Vuelo(var A_Vue:ArchivoVuelo);
Var Bus,x,s:integer;
    Pos,i:integer;
    R_Vue:TipoVuelo;
    Opc:char;
Begin
     TextColor(White);
     TextBackground(0);
     Clrscr;
     TextColor(12);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(15,5);
     Writeln('  Ingrese el ID del vuelo que desea modificar:');
     GotoXY(61,5);
     Readln(Bus);
     Abrir_VU(A_Vue);
     Busqueda_VU(A_Vue,Bus,Pos,R_Vue);
     If (Pos<>-1) then
     Begin
          Leer_VU(A_Vue,R_Vue,Pos);
          If (R_Vue.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(0);
                     Clrscr;
                     TextColor(12);
                     TextBackground(0);
                     InterfazPrincipal;
                     GotoXY(40,5);
                     Writeln('  El vuelo esta dado de alta');
                     GotoXY(15,8);
                     Writeln('  Sus datos son:');
                     GotoXY(31,9);
                     Writeln('> ID Vuelo: ',R_Vue.ID_Vuelo);
                     GotoXY(31,10);
                     Writeln('> ID Linea aerea: ',R_Vue.ID_LineaAerea);
                     GotoXY(31,11);
                     Writeln('> Origen: ',R_Vue.Origen);
                     GotoXY(31,12);
                     Writeln('> Fecha de partida: ',R_Vue.FechaP);
                     GotoXY(31,13);
                     Writeln('> Hora de partida: ',R_Vue.HoraP);
                     GotoXY(31,14);
                     Writeln('> Destino: ',R_Vue.Destino);
                     GotoXY(31,15);
                     Writeln('> Fecha de llegada: ',R_Vue.FechaL);
                     GotoXY(31,16);
                     Writeln('> Hora de llegada: ',R_Vue.HoraL);
                     x:=16;
                     For i:= 1 to 3 do
                     Begin
                          If (R_Vue.Escalas[i]<>'') then
                          Begin
                               Inc(x);
                               GotoXY(31,x);
                               Writeln('> Escalas: ',R_Vue.Escalas[i]);
                          End;
                     End;
                     inc(x);
                     GotoXY(31,x);
                     Writeln('> Cantidad de pasajeros: ',R_Vue.Cant_Pasajeros);
                     inc(x);
                     GotoXY(31,x);
                     Writeln('> Estado: ',R_Vue.Estado);
                     x:=x+2;
                     s:=x;
                     GotoXY(15,x);
                     Writeln('  Elija el campo que desea modificar:');
                     inc(x);
                     GotoXY(52,x);
                     Writeln('--> 1- Cantidad de pasajeros');
                     inc(x);
                     GotoXY(52,x);
                     Writeln('--> 2- Estado');
                     inc(x);
                     GotoXY(52,x);
                     Writeln('--> Esc- Salir');
                     GotoXY(52,s);
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
                                   Writeln('  Cantidad de pasajeros:');
                                   GotoXY(39,9);
                                   Readln(R_Vue.Cant_Pasajeros);
                                   Modificar_VU(A_Vue,Pos,R_Vue);
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
									Writeln('Seleccione el estado del vuelo: ');
									GotoXY(15,10);
									Writeln('1) Lleno.');
									GotoXY(15,11);
									Writeln('2) Disponible.');
									GotoXY(15,12);
									Writeln('3) Vacio.');
									R_Vue.Estado:=('0');
									while (R_Vue.Estado<>('1')) and (R_Vue.Estado<>('2')) and (R_Vue.Estado<>('3')) do
									begin
									GotoXY(48,9);
									Readln(R_Vue.Estado);
									End;
										if (R_Vue.Estado)=('1') then
										begin
										R_Vue.Estado:=('Lleno');
										end
											else if (R_Vue.Estado)=('2') then
											begin
											R_Vue.Estado:=('Disponible');
											end
											else R_Vue.Estado:=('Vacio');
                                   Modificar_VU(A_Vue,Pos,R_Vue);
                                   InterfazModificaciones;
                              End;
                     End;
               Until (Opc=#27);
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  El vuelo esta dado de baja.');
               GotoXY(15,10);
               Writeln('  Oprima enter para continuar.');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  El vuelo no existe');
          GotoXY(15,10);
		  Writeln('  Oprima enter para continuar.');
          Readkey;
     End;
     Cerrar_VU(A_Vue);
End;

Procedure Consulta_Vuelo(var A_Vue:ArchivoVuelo;var A_Aero:ArchivoAeropuerto;var A_LA:ArchivoLineaAerea);
Var pos,pos2,cantidad,i,j,c,x,bus,s,PunteroX,PunteroY:integer; Vec:TipoVectorVueloBB;
    R_Vue:TipoVuelo;   opc:char;
Begin
     Cargar_VU(A_Vue,Vec, cantidad);
     Burbuja_VU(Vec, cantidad);
     Abrir_VU(A_Vue);
     Abrir_A(A_Aero);
     Abrir_LA(A_LA);
     i:=1;
     opc:=#13;
     pos:=2;
     clrscr;
     InterfazConsultas;
     TextColor(white);
     TextBackground(0);
     GotoXY(2,2);
     PunteroY:=(4);
     Writeln('ID   |Linea   |Origen   |Fecha P.|Hora |Destino  |Fecha L.|Hora  |Escalas |Pasajeros |Estado');
     While(i<=cantidad) and (opc<>#27) do
     Begin
		  PunteroX:=(2);
          TextColor(white);
          TextBackground(0);
          Leer_VU(A_Vue,R_Vue,Vec[i].pos);
          GotoXY(PunteroX,PunteroY);
          Writeln(R_Vue.ID_Vuelo);
          PunteroX:=(PunteroX+5);
          GotoXY(PunteroX,PunteroY);
          Writeln('|',R_Vue.ID_LineaAerea);
          PunteroX:=(PunteroX+9);
          GotoXY(PunteroX,PunteroY);
          Writeln('|',R_Vue.Origen);
          PunteroX:=(PunteroX+10);
          GotoXY(PunteroX,PunteroY);;
          Writeln('|',R_Vue.FechaP);
          PunteroX:=(PunteroX+9);
          GotoXY(PunteroX,PunteroY);
          Writeln('|',R_Vue.HoraP);
          PunteroX:=(PunteroX+6);
          GotoXY(PunteroX,PunteroY);
          Writeln('|',R_Vue.Destino);
          PunteroX:=(PunteroX+10);
          GotoXY(PunteroX,PunteroY);
          Writeln('|',R_Vue.FechaL);
          PunteroX:=(PunteroX+9);
          GotoXY(PunteroX,PunteroY);
          Writeln('|',R_Vue.HoraL);
          PunteroX:=(PunteroX+7);
          GotoXY(PunteroX,PunteroY);
          c:=0;
          For j:= 1 to 3 do
          Begin
               If (R_Vue.Escalas[j]<>'') then
               Begin
                    inc(c);
               End;
          End;
          Writeln('|',c);
          PunteroX:=(PunteroX+9);
          GotoXY(PunteroX,PunteroY);
          Writeln('|',R_Vue.Cant_Pasajeros);
          PunteroX:=(PunteroX+11);
          GotoXY(PunteroX,PunteroY);
          Writeln('|',R_Vue.Estado);
          inc(pos);
          inc(i);
		  inc(PunteroY);
          If ((pos=26) or (i=cantidad+1)) then
          Begin
               TextColor(White);
               TextBackground(0);
               GotoXY(20,29);
               Writeln(' <- : Anterior | -> : Siguiente | E:Ver escalas | ESC:Salir :');
               TextColor(12);
               TextBackground(0);
               Repeat
                     GotoXY(81,29);
                     opc:=readkey;
               Until  (opc=#27) or (opc=#75) or (opc=#77) or (opc='e');
               If (Opc='e') then
               Begin
                    InterfazAux;
                    GotoXY(15,9);
                    Write('Ingrese el ID del vuelo para ver las escalas: ');
                    Readln(bus);
                    pos2:=-1;
                    seek(A_Vue,0);
                    Busqueda_VU(A_Vue,bus,pos2,R_Vue);
                    If (pos2<>-1) then
                    Begin
                         s:=0;
                         x:=12;
                         For j:= 1 to 3 do
                         Begin
                              inc(x);
                              GotoXY(40,x);
                              Writeln(R_Vue.Escalas[j]);
                              if (R_Vue.Escalas[j]='') then
                              Begin
                                   Inc(s);
                              End;
                         End;
                         if (s=3) then
                         Begin
                              GotoXY(40,13);
                              Writeln(' El vuelo no posee escalas');
                         End;
                         TextColor(12);
                         TextBackground(0);
                    End
                    Else
                    Begin
                         GotoXY(37,12);
                         Writeln('No existe el vuelo');
                         TextColor(12);
                         TextBackground(0);
                    End;
                    Readkey;
                    i:=i-(pos-2);
                    pos:=2;
                    clrscr;
                    TextColor(12);
                    TextBackground(0);
                    gotoxy(1,1);
					Writeln('ID   |Linea   |Origen   |Fecha P.|Hora |Destino  |Fecha L.|Hora  |Escalas |Pasajeros |Estado');
               End;
               If (opc=#75) and (i>=27) then
               begin
                    If (i>26) then
                       i:=i-26-(pos-3)
                    Else
                       i:=1;
                       pos:=2;
                       clrscr;
                       TextColor(12);
                       TextBackground(0);
                       gotoxy(1,1);
						Writeln('ID   |Linea   |Origen   |Fecha P.|Hora |Destino  |Fecha L.|Hora  |Escalas |Pasajeros |Estado');
               end;
               If (opc=#77) and (i<cantidad)then
               begin
                    pos:=2;
                    clrscr;
                    TextColor(12);
                    TextBackground(0);
                    gotoxy(1,1);
					Writeln('ID   |Linea   |Origen   |Fecha P.|Hora |Destino  |Fecha L.|Hora  |Escalas |Pasajeros |Estado');
               end;
          end;
     end;
     Cerrar_VU(A_Vue);
     Cerrar_A(A_Aero);
     Cerrar_LA(A_LA);
     Readkey;
End;


Begin
End.
