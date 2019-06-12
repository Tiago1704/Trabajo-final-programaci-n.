 unit Unit_Menu;

interface

Uses Crt,Unit_Aeropuerto,Unit_Pasajero,Unit_LineaAerea,Unit_Vuelo,Unit_Venta,Unit_Reserva,Unit_Archivos,Unit_Busquedas,Unit_Interfaz,Unit_Sonido,Unit_Opciones;

Procedure Menu_Aeropuertos;
Procedure Menu_Vuelos;
Procedure Menu_Reservas;
Procedure Menu_Pasajeros;
Procedure Menu_Ventas;
Procedure Menu_Lineas;
Procedure Menu_Busqueda;
Procedure Menu_CopiasDeSeguridad;
Procedure Menu_CargarRespaldos;
Procedure Menu_CrearRespaldos;
Procedure Menu_CargaAutomatica;
Procedure Menu_LimpiarDatos;
Procedure Menu_OpcionesExtra;
procedure Menu_Principal;


implementation

Procedure Menu_Vuelos;
var Opc:char;
Begin
     TextColor(15);
     TextBackground(0);
     Repeat
     Clrscr;
     InterfazPrincipal;
     GotoXY(23,5);
     Writeln('                          MENU DE VUELOS                            ');
     GotoXY(38,11);
     Writeln('Opciones:');
     GotoXY(48,13);
     Writeln('1) Alta de Vuelos.');
     GotoXY(48,15);
     Writeln('2) Baja de Vuelos.');
     GotoXY(48,17);
     Writeln('3) Modificacion de Vuelos.');
     GotoXY(48,19);
     Writeln('4) Consulta de Vuelos.');
	 TextColor(4);
     GotoXY(73,27);
     HighVideo;
     Writeln('Esc) Regresar al Menu Principal');
     TextColor(1);
     NormVideo;
     Opc:=readkey;
     Case (Opc) of
           '1': Alta_Vuelo(ArchivoVueloV,Arch_A,ArchivoLineaAereaV);
           '2': Baja_Vuelo(ArchivoVueloV);
           '3': Modificar_Vuelo(ArchivoVueloV);
           '4': Consulta_Vuelo(ArchivoVueloV,Arch_A,ArchivoLineaAereaV);
          End;
          TextColor(15);
          TextBackground(0);
          readkey;
     Until(Opc=#27);
End;

Procedure Menu_Reservas;
var Opc:char;
Begin
     TextColor(15);
     TextBackground(0);
     Repeat
     Clrscr;
     InterfazPrincipal;
     GotoXY(23,5);
     Writeln('                         MENU DE RESERVAS');
     GotoXY(38,11);
     Writeln('Opciones:');
     GotoXY(48,13);
     Writeln('1) Alta de Reservas.');
     GotoXY(48,15);
     Writeln('2) Baja de Reservas.');
     GotoXY(48,17);
     Writeln('3) Modificacion de Reservas.');
     GotoXY(48,19);
     Writeln('4) Consulta de Reservas.');
	 TextColor(4);
	 HighVideo;
     GotoXY(73,27);
     Writeln('Esc) Regresar al Menu Principal');
     TextColor(1);
     NormVideo;
     Opc:=readkey;
     Case (Opc) of
          '1': Alta_Reserva(Arch_R,Arch_P,ArchivoVueloV,Arch_A,ArchivoLineaAereaV);
          '2': Baja_Reserva(Arch_R);
          '3': Modificar_Reserva(Arch_R);
          '4': Consulta_Reserva(Arch_R,Arch_P,ArchivoVueloV);
          End;
          TextColor(15);
          TextBackground(0);
          readkey;
     Until(Opc=#27);
End;

Procedure Menu_Pasajeros;
var Opc:char;
Begin
     TextColor(15);
     TextBackground(0);
     Repeat
     Clrscr;
     InterfazPrincipal;
     GotoXY(23,5);
     Writeln('                        MENU DE PASAJEROS');
     GotoXY(38,11);
     Writeln(' Opciones:');
     GotoXY(48,13);
     Writeln('1) Alta de Pasajeros.');
     GotoXY(48,15);
     Writeln('2) Baja de Pasajeros.');
     GotoXY(48,17);
     Writeln('3) Modificacion de Pasajeros.');
     GotoXY(48,19);
     Writeln('4) Consulta de Pasajeros.');
	 TextColor(4);
     GotoXY(73,27);
     HighVideo;
     Writeln('Esc) Regresar al Menu Principal');
     TextColor(1);
     NormVideo;
     Opc:=readkey;
     Case (Opc) of
          '1': Alta_Pasajero(Arch_P);
          '2': Baja_Pasajero(Arch_P);
          '3': Modificar_Pasajero(Arch_P);
          '4': Consulta_Pasajero(Arch_P);
          End;
          TextColor(15);
          TextBackground(0);
          readkey;
     Until(Opc=#27);
End;

Procedure Menu_Aeropuertos;
Var Opc:char;
Begin
     TextColor(15);
     TextBackground(0);
     Repeat
     Clrscr;
     InterfazPrincipal;
     GotoXY(23,5);
     Writeln('                       MENU DE AEROPUERTOS');
     GotoXY(38,11);
     Writeln('Opciones:');
     GotoXY(48,13);
     Writeln('1) Alta de Aeropuertos.');
     GotoXY(48,15);
     Writeln('2) Baja de Aeropuertos.');
     GotoXY(48,17);
     Writeln('3) Modificacion de Aeropuertos.');
     GotoXY(48,19);
     Writeln('4) Consulta de Aeropuertos.');
	 TextColor(4);
     GotoXY(73,27);
     HighVideo;
     Writeln('Esc) Regresar al Menu Principal');
     TextColor(1);
     NormVideo;
     Opc:=readkey;
     Case (Opc) of
          '1': Alta_Aeropuerto(Arch_A);
          '2': Baja_Aeropuerto(Arch_A);
          '3': Modificar_Aeropuerto(Arch_A);
          '4': Consulta_Aeropuerto(Arch_A);
          End;
          TextColor(15);
          TextBackground(0);
          readkey;
     Until(Opc=#27);
End;

Procedure Menu_Ventas;
var Opc:char;
Begin
     TextColor(15);
     TextBackground(0);
     Repeat
     Clrscr;
     InterfazPrincipal;
     GotoXY(23,5);
     Writeln('                          MENU DE VENTAS');
     GotoXY(38,11);
     Writeln('Opciones:');
     GotoXY(48,13);
     Writeln('1) Alta de Ventas.');
     GotoXY(48,15);
     Writeln('2) Baja de Ventas.');
     GotoXY(48,17);
     Writeln('3) Modificacion de Ventas.');
     GotoXY(48,19);
     Writeln('4) Consulta de Ventas.');
	 TextColor(4);
     GotoXY(73,27);
     HighVideo;
     Writeln('Esc) Regresar al Menu Principal');
     TextColor(1);
     NormVideo;
     Opc:=readkey;
     Case (Opc) of
          '1': Alta_Venta(ArchivoVentaV,Arch_P);
          '2': Baja_Venta(ArchivoVentaV);
          '3': Modificar_Venta(ArchivoVentaV);
          '4': Consulta_Venta(ArchivoVentaV,Arch_P);
          End;
          TextColor(15);
          TextBackground(0);
          readkey;
     Until(Opc=#27);
End;

Procedure Menu_Lineas;
var Opc:char;
Begin
     TextColor(15);
     TextBackground(0);
     Repeat
     Clrscr;
     InterfazPrincipal;
     GotoXY(23,5);
     Writeln('                       MENU DE LINEAS AEREAS');
     GotoXY(38,11);
     Writeln('Opciones:');
     GotoXY(48,13);
     Writeln('1) Alta de Lineas Aereas.');
     GotoXY(48,15);
     Writeln('2) Baja de Lineas Aereas.');
     GotoXY(48,17);
     Writeln('3) Modificacion de Lineas Aereas.');
     GotoXY(48,19);
     Writeln('4) Consulta de Lineas Aereas.');
	 TextColor(4);
     GotoXY(73,27);
     HighVideo;
     Writeln('Esc) Regresar al Menu Principal');
     TextColor(1);
     NormVideo;
     Opc:=readkey;
     Case (Opc) of
          '1': Alta_Linea(ArchivoLineaAereaV);
          '2': Baja_Linea(ArchivoLineaAereaV);
          '3': Modificar_Linea(ArchivoLineaAereaV);
          '4': Consulta_Linea(ArchivoLineaAereaV);
          End;
          TextColor(15);
          TextBackground(0);
          readkey;
     Until(Opc=#27);
End;

Procedure Menu_Busqueda;
var Opc:char;
Begin
     TextColor(15);
     TextBackground(0);
     Repeat
     Clrscr;
     TextColor(15);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(23,5);
     Writeln('                          MENU DE BUSQUEDA');
     GotoXY(27,10);
     Writeln('Opciones:');
     GotoXY(37,11);
     Writeln('1) Segun una fecha, vuelos que despegan de un aeropuerto.');
     GotoXY(37,13);
     Writeln('2) Segun un rango de fechas, vuelos realizados por una linea aerea.');
     GotoXY(37,15);
     Writeln('3) Segun un pasajero, vuelos que ha realizado .');
	 TextColor(4);
     GotoXY(73,27);
     HighVideo;
     Writeln('Esc) Regresar al Menu Principal');
     TextColor(1);
     NormVideo;
     Opc:=readkey;
     Case (Opc) of
           '1': Fecha_Vuelo_Aeropuerto(ArchivoVueloV,Arch_A);
           '2': Fechas_Vuelo_Aerolinea(ArchivoVueloV,ArchivoLineaAereaV);
           '3': Pasajero_Vuelo(Arch_R,ArchivoVueloV,Arch_P);
          End;
          TextColor(15);
          TextBackground(0);
          readkey;
     Until(Opc=#27);
End;

Procedure Menu_CopiasDeSeguridad;
var Opc:char;
Begin
     TextColor(15);
     TextBackground(0);
     Repeat
     Clrscr;
          InterfazPrincipal;
     GotoXY(23,5);
     Writeln('                          COPIAS DE SEGURIDAD');
     GotoXY(38,11);
     Writeln('Opciones:');
     GotoXY(48,13);
     Writeln('1) Cargar copias de seguridad.');
     GotoXY(48,15);
     Writeln('2) Generar copias de seguridad.');
	 TextColor(4);
     GotoXY(73,27);
     HighVideo;
     Writeln('Esc) Regresar al Menu Principal');
     TextColor(1);
     NormVideo;
     Opc:=readkey;
     Case (Opc) of
           '1': Menu_CargarRespaldos();
           '2': Menu_CrearRespaldos();
          End;
          TextColor(15);
          TextBackground(0);
          readkey;
     Until(Opc=#27);
End;

Procedure Menu_CargarRespaldos;
var Opc:char;
Begin
     TextColor(12);
     TextBackground(0);
     Repeat
     Clrscr;
          InterfazPrincipal;
     GotoXY(23,5);
     Writeln('                   CARGAR COPIAS DE SEGURIDAD');
     GotoXY(38,11);
     Writeln('Opciones:');
     GotoXY(48,13);
     Writeln('1) Cargar copia de vuelos.');
     GotoXY(48,15);
     Writeln('2) Cargar copia de ventas.');
     GotoXY(48,17);
     Writeln('3) Cargar copia de pasajeros.');
     GotoXY(48,19);
     Writeln('4) Cargar copia de reservas.');
     GotoXY(48,21);
     Writeln('5) Cargar copia de lineas aereas.');
     GotoXY(48,23);
     Writeln('6) Cargar copia de aeropuertos.');
     GotoXY(48,25);
     Writeln('7) Cargar copia completa.');
	 TextColor(4);
     GotoXY(73,27);
     HighVideo;
     Writeln('Esc) Regresar al Menu Principal');
     TextColor(1);
     NormVideo;
     Opc:=readkey;
     Case (Opc) of
           '1': CargarBackUpVuelo();
           '2': CargarBackUpVentas();
           '3': CargarBackUpPasajeros();
           '4': CargarBackUpReservas();
           '5': CargarBackUpLineasAereas();
           '6': CargarBackUpAeropuertos();
           '7': CargarBackUpCompleto();
          End;
          TextColor(15);
          TextBackground(0);
          readkey;
     Until(Opc=#27);
End;


Procedure Menu_CrearRespaldos;
var Opc:char;
Begin
     TextColor(14);
     TextBackground(0);
     Repeat
     Clrscr;
          InterfazPrincipal;
     GotoXY(23,5);
     Writeln('                   CREAR COPIAS DE SEGURIDAD');
     GotoXY(38,11);
     Writeln('Opciones:');
     GotoXY(48,13);
     Writeln('1) Generar copia de vuelos.');
     GotoXY(48,15);
     Writeln('2) Generar copia de ventas.');
     GotoXY(48,17);
     Writeln('3) Generar copia de pasajeros.');
     GotoXY(48,19);
     Writeln('4) Generar copia de reservas.');
     GotoXY(48,21);
     Writeln('5) Generar copia de lineas aereas.');
     GotoXY(48,23);
     Writeln('6) Generar copia de aeropuertos.');
     GotoXY(48,25);
     Writeln('7) Generar copia de completa.');
	 TextColor(4);
     GotoXY(73,27);
     HighVideo;
     Writeln('Esc) Regresar al Menu Principal');
     TextColor(1);
     NormVideo;
     Opc:=readkey;
     Case (Opc) of
           '1': BackUpVuelo();
           '2': BackUpVentas();
           '3': BackUpPasajeros();
           '4': BackUpReservas();
           '5': BackUpLineasAereas();
           '6': BackUpAeropuertos();
           '7': BackUpCompleto();
          End;
          TextColor(15);
          TextBackground(0);
          readkey;
     Until(Opc=#27);
End;


Procedure Menu_CargaAutomatica;

var Opc:char;
	i:integer;
	
Begin
	 i:=(0);
     TextColor(14);
     TextBackground(0);
     Repeat
     Clrscr;
          InterfazPrincipal;
     GotoXY(23,5);
     Writeln('                   CARGAR DE DATOS AUTOMATIZADA');
     GotoXY(38,11);
     Writeln('Opciones:');
     GotoXY(48,13);
     Writeln('1) Generar datos de Aeropuertos.');
     GotoXY(48,15);
     Writeln('2) Generar datos de Lineas Aereas.');
     GotoXY(48,17);
     Writeln('3) Generar datos de Pasajeros.');
	 TextColor(4);
     GotoXY(73,27);
     HighVideo;
     Writeln('Esc) Regresar al Menu Principal');
     TextColor(1);
     NormVideo;
     Opc:=readkey;
     Case (Opc) of
           '1': CargarDatosAeropuertos(i);
           '2': CargarDatosLineasAereas(i);
           '3': CargarDatosPasajeros(i);
          End;
          TextColor(15);
          TextBackground(0);
          readkey;
     Until(Opc=#27);
End;

Procedure Menu_LimpiarDatos;
var Opc:char;
	
Begin
     TextColor(14);
     TextBackground(0);
     Repeat
     Clrscr;
          InterfazPrincipal;
     GotoXY(23,5);
     Writeln('                   VACIAR ARCHIVOS');
     GotoXY(38,11);
     Writeln('Opciones:');
     GotoXY(48,13);
     Writeln('1) Vaciar archivo de Aeropuertos.');
     GotoXY(48,15);
     Writeln('2) Vaciar archivo de Lineas Aereas.');
     GotoXY(48,17);
     Writeln('3) Vaciar archivo de Vuelos.');
     GotoXY(48,19);
     Writeln('4) Vaciar archivo de Reservas.');
     GotoXY(48,21);
     Writeln('5) Vaciar archivo de lineas aereas.');
     GotoXY(48,23);
     Writeln('6) Vaciar archivo de vuelos.');
     GotoXY(48,25);
     Writeln('7) Vaciar archivo de completa.');
	 TextColor(4);
     GotoXY(73,27);
     HighVideo;
     Writeln('Esc) Regresar al Menu Principal');
     TextColor(1);
     NormVideo;
     Opc:=readkey;
     Case (Opc) of
           '1': VaciarDatosAeropuertos();
           '2': VaciarDatosLineasAereas();
           '3': VaciarDatosVuelos();
           '4': VaciarDatosReservas();
     //
     //      '5': BackUpLineasAereas();
     //      '6': BackUpAeropuertos();
     //      '7': BackUpCompleto();
          End;
          TextColor(15);
          TextBackground(0);
          readkey;
     Until(Opc=#27);
End;


Procedure Menu_OpcionesExtra;
var Opc:char;
Begin
     TextColor(14);
     TextBackground(0);
     Repeat
     Clrscr;
          InterfazPrincipal;
     GotoXY(23,5);
     Writeln('                   OPCIONES EXTRA');
     GotoXY(38,11);
     Writeln('Opciones:');
     GotoXY(48,13);
     Writeln('1) Copias de seguridad.');
     GotoXY(48,15);
     Writeln('2) Generar datos automaticamente.');
     GotoXY(48,17);
     Writeln('3) Vaciar archivos de datos.');
     GotoXY(48,19);
     //Writeln('4) Vaciar archivos de datos.');
     //GotoXY(48,21);
     //Writeln('5) Prox.');
     //GotoXY(48,23);
     //Writeln('6) Prox.');
     //GotoXY(48,25);
     //Writeln('7) Prox.');
	 TextColor(4);
     GotoXY(73,27);
     HighVideo;
     Writeln('Esc) Regresar al Menu Principal');
     TextColor(1);
     NormVideo;
     Opc:=readkey;
     Case (Opc) of
           '1': Menu_CopiasDeSeguridad();
           '2': Menu_CargaAutomatica();
           '3': Menu_LimpiarDatos();
           //'4': 
           //'5': 
           //'6': 
           //'7': 
          End;
          TextColor(15);
          TextBackground(0);
          readkey;
     Until(Opc=#27);
End;

procedure Menu_Principal();
var Opc:char;
begin
     Repeat
     clrscr;
     TextColor(1);
     TextBackground(0);
     InterfazPrincipal;
     GotoXY(23,5);
     Writeln('                          MENU PRINCIPAL                            ');
     GotoXY(27,10);
     Writeln('Ingrese una opcion:');
     GotoXY(48,11);
     Writeln('1) Menu Aeropuertos.');
     GotoXY(48,13);
     Writeln('2) Menu de Lineas Aereas.');
     GotoXY(48,15);
     Writeln('3) Menu de Vuelos.');
     GotoXY(48,17);
     Writeln('4) Menu de Pasajeros.');
     GotoXY(48,19);
     Writeln('5) Menu de Reservas.');
     GotoXY(48,21);
     Writeln('6) Menu de Ventas.');
     GotoXY(48,23);
     Writeln('7) Menu de Busqueda.');
     GotoXY(48,25);
     Writeln('8) Opciones extra.');
     TextColor(4);
     GotoXY(94,27);
     HighVideo;
     Writeln('Esc) Salir');
     TextColor(1);
     NormVideo;
     Opc:=readkey;
     Case (Opc) of
          '1': Menu_Aeropuertos;
          '2': Menu_Lineas;
          '3': Menu_Vuelos;
          '4': Menu_Pasajeros;
          '5': Menu_Reservas;
          '6': Menu_Ventas;
          '7': Menu_Busqueda;
          '8': Menu_OpcionesExtra;
          End;
     Until(Opc=#27);
end;

begin
end.
