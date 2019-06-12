Unit Unit_Archivos;
Interface

Uses Crt,sysutils,dos,Unit_Sonido;

//Type de vuelos
Type TipoVuelo=record
        Origen:string[30];//ID_Aeropuerto
        ID_Vuelo:LongInt;
		FechaP:String[10];
        HoraP:string[10];
        Destino:string[30];//ID_Aeropuerto
        FechaL:string[20];
        HoraL:string[10];
        Escalas:array [1..3] of string;
        ID_LineaAerea:string[30];
        Cant_Pasajeros:LongInt;
        Estado:string;
        Activo:boolean;
     End;
     
     ArchivoVuelo= file of TipoVuelo;
     TipoVueloBB = record
             ID_Vuelo: integer;
             Pos: integer;
     end;
     
     TipoVectorVueloBB = array [1..100] of TipoVueloBB;

    //Type de Ventas:
Type TipoVenta=record
        ID_Venta:LongInt;
        Costo:real;
        Fecha:string[20];
        Hora:string[10];
        ID_Pasajero:LongInt;
        Activo:boolean;
     End;
     ArchivoVenta= file of TipoVenta;
     TipoVentaBB = record
            ID_Venta: integer;
            Pos: integer;
     end;
     TipoVectorVenta = array [1..100] of TipoVentaBB;

    //Type de Reservas:
Type TipoReserva=record
        ID_Reserva:LongInt;
        ID_Pasajero:LongInt;
        ID_Vuelo:LongInt;
        Fecha:string[20];
        Hora:string[10];
        Costo:real;
        Activo:boolean;
     End;
     ArchivoReserva= file of TipoReserva;
     
     TipoReservaBB = record
            ID_Reserva: integer;
            Pos: integer;
     end;
     TipoVectorReserva = array [1..100] of TipoReservaBB;

    //Type de Pasajeros:
Type TipoPasajero=record
        ID_Pasajero:integer;
        Apellido:string[50];
        Nombre:string[50];
        Edad:LongInt;
        Activo:boolean;
     End;
     ArchivoPasajero= file of TipoPasajero;
     
     TipoPasajeroBB = record
            Apellido: String[50];
            Nombre: String[50];
            Pos: integer;
     end;
     TipoVectorPasajero = array [1..100] of TipoPasajeroBB;

    //Type de Linea Aerea:
Type TipoLineaAerea=record
        ID_LineaAerea:string[30];
        Cuit:string[15];
        Nombre:string[50];
        Domicilio:string[50];
        Activo:boolean;
     End;
     ArchivoLineaAerea= file of TipoLineaAerea;
     TipoLineaAereaBB = record
            Nombre: String[50];
            Pos: integer;
     end;
     TipoVectorLineaAerea = array [1..100] of TipoLineaAereaBB;

    //Type de Aeropuerto:    
Type TipoAeropuerto=record
        ID_Aeropuerto:string;
        Nombre:string[50];
        Ciudad:string[50];
        Pais:string[50];
        Activo:boolean;
     End;

     ArchivoAeropuerto= file of TipoAeropuerto;
     TipoAeroBB = record
            ID_Aeropuerto:string;
            Nombre: String[50];
            Pais: String[50];
            Ciudad: String[50];
            Pos: integer;
     end;

     TipoVectorAero = array [1..100] of TipoAeroBB;


Var //Variables para Vuelos:
	ArchivoVueloV:ArchivoVuelo;
    RegistroVueloV:TipoVuelo;

    //Variables para Ventas:
    ArchivoVentaV:ArchivoVenta;
    RegistroVentaV:TipoVenta;

    //Variables para Reservas:
    Arch_R:ArchivoReserva;
    Reg_R:TipoReserva;

    //Variables para Pasajeros:
    Arch_P:ArchivoPasajero;
    Reg_P:TipoPasajero;

    //Variables para Linea Aerea:
    ArchivoLineaAereaV:ArchivoLineaAerea;
    RegistroLineaAereaV:TipoLineaAerea;

    //Variables para Aeropuerto:
    Arch_A:ArchivoAeropuerto;
    Reg_A:TipoAeropuerto;
    
    //Variables para BB:
    Posicion:integer;
    Buscado:integer;

    

//Procedimientos Vuelo:
Procedure Abrir_VU(var A_Vue:ArchivoVuelo);
Procedure Cerrar_VU(var A_Vue:ArchivoVuelo);
Procedure Leer_VU(var A_Vue:ArchivoVuelo; var R_Vue:TipoVuelo; Pos:integer);
Procedure Modificar_VU(var A_Vue:ArchivoVuelo;Pos:integer;R_Vue:TipoVuelo);
Procedure Guardar_VU(var A_Vue:ArchivoVuelo;R_Vue:TipoVuelo);
Procedure Busqueda_VU(var A_Vue:ArchivoVuelo; Bus:integer;var Pos:integer;var R_Vue:TipoVuelo);
procedure Cargar_VU(var A_Vue:ArchivoVuelo; var V:TipoVectorVueloBB; var Cant:integer);
Procedure Burbuja_VU(var V:TipoVectorVueloBB; var Cant:integer);

//Procedimientos Venta:
Procedure Abrir_VE(var A_Ven:ArchivoVenta);
Procedure Cerrar_VE(var A_Ven:ArchivoVenta);
Procedure Leer_VE(var A_Ven:ArchivoVenta; var R_Ven:TipoVenta; Pos:integer);
Procedure Modificar_VE(var A_Ven:ArchivoVenta;Pos:integer;R_Ven:TipoVenta);
Procedure Guardar_VE(var A_Ven:ArchivoVenta;R_Ven:TipoVenta);
Procedure Busqueda_VE(var A_Ven:ArchivoVenta; Bus:integer; var Pos:integer;var R_Ven:TipoVenta);
procedure Cargar_VE(var A_Ven:ArchivoVenta; var V:TipoVectorVenta; var Cant:integer);
Procedure Burbuja_VE(var V:TipoVectorVenta; var Cant:integer);

//Procedimientos Reservas:
Procedure Abrir_R(var A_Res:ArchivoReserva);
Procedure Cerrar_R(var A_Res:ArchivoReserva);
Procedure Leer_R(var A_Res:ArchivoReserva; var R_Res:TipoReserva; Pos:integer);
Procedure Modificar_R(var A_Res:ArchivoReserva;Pos:integer;R_Res:TipoReserva);
Procedure Guardar_R(var A_Res:ArchivoReserva;R_Res:TipoReserva);
Procedure Busqueda_R(var A_Res:ArchivoReserva; Bus:integer; var Pos:integer;var R_Res:TipoReserva);
procedure Cargar_R(var A_Res:ArchivoReserva; var V:TipoVectorReserva; var Cant:integer);
Procedure Burbuja_R(var V:TipoVectorReserva; var Cant:integer);

//Procedimientos Pasajeros:
Procedure Abrir_P(var A_Pasaj:ArchivoPasajero);
Procedure Cerrar_P(var A_Pasaj:ArchivoPasajero);
Procedure Leer_P(var A_Pasaj:ArchivoPasajero; var R_Pasaj:TipoPasajero; Pos:integer);
Procedure Modificar_P(var A_Pasaj:ArchivoPasajero;Pos:integer;R_Pasaj:TipoPasajero);
Procedure Guardar_P(var A_Pasaj:ArchivoPasajero;R_Pasaj:TipoPasajero);
Procedure Busqueda_P(var A_Pasaj:ArchivoPasajero; Bus:integer; var Pos:integer;var R_Pasaj:TipoPasajero);
procedure Cargar_P(var A_Pasaj:ArchivoPasajero; var V:TipoVectorPasajero; var Cant:integer);
Procedure Burbuja_P(var V:TipoVectorPasajero; var Cant:integer);

//Procedimientos Linea Aerea:
Procedure Abrir_LA(var A_LA:ArchivoLineaAerea);
Procedure Cerrar_LA(var A_LA:ArchivoLineaAerea);
Procedure Leer_LA(var A_LA:ArchivoLineaAerea; var R_LA:TipoLineaAerea; Pos:integer);
Procedure Modificar_LA(var A_LA:ArchivoLineaAerea;Pos:integer;R_LA:TipoLineaAerea);
Procedure Guardar_LA(var A_LA:ArchivoLineaAerea;R_LA:TipoLineaAerea);
Procedure Busqueda_LA(var A_LA:ArchivoLineaAerea; Bus:string; var Pos:integer;var R_LA:TipoLineaAerea; var ID:integer);
procedure Cargar_LA(var A_LA:ArchivoLineaAerea; var V:TipoVectorLineaAerea; var Cant:integer);
Procedure Burbuja_LA(var V:TipoVectorLineaAerea; var Cant:integer);

//Procedimientos Aeropuerto:
Procedure Abrir_A(var A_Aero:ArchivoAeropuerto);
Procedure Cerrar_A(var A_Aero:ArchivoAeropuerto);
Procedure Leer_A(var A_Aero:ArchivoAeropuerto; var R_Aero:TipoAeropuerto; Pos:integer);
Procedure Modificar_A(var A_Aero:ArchivoAeropuerto;Pos:integer;R_Aero:TipoAeropuerto);
Procedure Guardar_A(var A_Aero:ArchivoAeropuerto;R_Aero:TipoAeropuerto);
Procedure Busqueda_A(var A_Aero:ArchivoAeropuerto;var Pos:integer;Bus:string; var R_Aero:TipoAeropuerto; var ID:Integer);
procedure Cargar_A(var A_Aero:ArchivoAeropuerto; var V:TipoVectorAero; var Cant:integer);
Procedure Burbuja_A(var V:TipoVectorAero; var Cant:integer);

Implementation

//Procedimientos de Vuelos:
Procedure Abrir_VU(var A_Vue:ArchivoVuelo);
begin
     Assign(A_Vue,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeVuelos.dat');
     Reset(A_Vue);
     If (ioresult <> 0) then
     Rewrite(A_Vue);
end;

Procedure Cerrar_VU(var A_Vue:ArchivoVuelo);
begin
     Close(A_Vue)
end;

procedure Leer_VU(var A_Vue:ArchivoVuelo; var R_Vue:TipoVuelo; Pos:integer);
begin
     seek(A_Vue,Pos);
     read(A_Vue,R_Vue);
end;

Procedure Modificar_VU(var A_Vue:ArchivoVuelo; Pos:integer; R_Vue:TipoVuelo);
begin
     seek(A_Vue,Pos);
     write(A_Vue,R_Vue);
end;

Procedure Guardar_VU(var A_Vue:ArchivoVuelo;R_Vue:TipoVuelo);
begin
     seek(A_Vue,filesize(A_Vue));
     write(A_Vue,R_Vue);
end;

Procedure Busqueda_VU(var A_Vue:ArchivoVuelo; Bus:integer;var Pos:integer;var R_Vue:TipoVuelo);
var P:integer;
Begin
     Pos:=-1;
     P:=0;
     seek(A_Vue,0);
     While (Not eof (A_Vue)) and (Pos=-1) do
     Begin
          Leer_VU(A_Vue,R_Vue,P);
          If (Bus=R_Vue.ID_Vuelo) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
     End;
End;

procedure Cargar_VU(var A_Vue:ArchivoVuelo; var V:TipoVectorVueloBB; var Cant:integer);
var p:integer;
begin
     Abrir_VU(A_Vue);
     p:=0;
     Cant:=0;
     while(not eof(A_Vue)) do
     begin
          Leer_VU(A_Vue, RegistroVueloV, p);
          if(RegistroVueloV.Activo) then
          begin
                inc(Cant);
                V[Cant].ID_Vuelo := RegistroVueloV.ID_Vuelo;
                V[Cant].pos:= p;
          end;
          inc(p);
     end;
     Cerrar_VU(A_Vue);
end;

Procedure Burbuja_VU(var V:TipoVectorVueloBB; var Cant:integer);
Var I,J:byte;
    Aux:TipoVueloBB;
Begin
     For I:= 1 to (Cant-1) do //recorridas
     Begin
          For J:= 1 to (Cant-I) do //comparaciones
          Begin
               If (V[J].ID_Vuelo)>(V[J+1].ID_Vuelo) then
               Begin
                    Aux:=V[J];
                    V[J]:=V[J+1];
                    V[J+1]:=Aux;
               End;
          End;
     End;
End;


//Procedimientos de Ventas:
Procedure Abrir_VE(var A_Ven:ArchivoVenta);
begin
     Assign(A_Ven,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeVentas.dat');
     Reset(A_Ven);
     If (ioresult <> 0) then
     Rewrite(A_Ven);
end;

Procedure Cerrar_VE(var A_Ven:ArchivoVenta);
begin
     Close(A_Ven)
end;

procedure Leer_VE(var A_Ven:ArchivoVenta; var R_Ven:TipoVenta; Pos:integer);
begin
     seek(A_Ven,Pos);
     read(A_Ven,R_Ven);
end;

Procedure Modificar_VE(var A_Ven:ArchivoVenta; Pos:integer; R_Ven:TipoVenta);
begin
     seek(A_Ven,Pos);
     write(A_Ven,R_Ven);
end;

Procedure Guardar_VE(var A_Ven:ArchivoVenta;R_Ven:TipoVenta);
begin
     seek(A_Ven,filesize(A_Ven));
     write(A_Ven,R_Ven);
end;

Procedure Busqueda_VE(var A_Ven:ArchivoVenta; Bus:integer; var Pos:integer;var R_Ven:TipoVenta);
var P:integer;
Begin
     Pos:=-1;
     P:=0;
     While (Not eof (A_Ven)) and (Pos=-1) do
     Begin
          Leer_VE(A_Ven,R_Ven,P);
          If (Bus=R_Ven.ID_Venta) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
     End;
End;

procedure Cargar_VE(var A_Ven:ArchivoVenta; var V:TipoVectorVenta; var Cant:integer);
var p:integer;
begin
     Abrir_VE(A_Ven);
     p:=0;
     Cant:=0;
     while(not eof(A_Ven)) do
     begin
          Leer_VE(A_Ven, RegistroVentaV, p);
          if(RegistroVentaV.Activo) then
          begin
                inc(Cant);
                V[Cant].ID_Venta := RegistroVentaV.ID_Venta;
                V[Cant].pos:= p;
          end;
          inc(p);
     end;
     Cerrar_VE(A_Ven);
end;

Procedure Burbuja_VE(var V:TipoVectorVenta; var Cant:integer);
Var I,J:byte;
    Aux:TipoVentaBB;
Begin
     For I:= 1 to (Cant-1) do //recorridas
     Begin
          For J:= 1 to (Cant-I) do //comparaciones
          Begin
               If (V[J].ID_Venta)>(V[J+1].ID_Venta) then
               Begin
                    Aux:=V[J];
                    V[J]:=V[J+1];
                    V[J+1]:=Aux;
               End;
          End;
     End;
End;


//Procedimientos de Reservas:
Procedure Abrir_R(var A_Res:ArchivoReserva);
begin
     Assign(A_Res,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeReservas.dat');
     Reset(A_Res);
     If (ioresult <> 0) then
     Rewrite(A_Res);
end;

Procedure Cerrar_R(var A_Res:ArchivoReserva);
begin
     Close(A_Res)
end;

procedure Leer_R(var A_Res:ArchivoReserva; var R_Res:TipoReserva; Pos:integer);
begin
     seek(A_Res,Pos);
     read(A_Res,R_Res);
end;

Procedure Modificar_R(var A_Res:ArchivoReserva; Pos:integer; R_Res:TipoReserva);
begin
     seek(A_Res,Pos);
     write(A_Res,R_Res);
end;

Procedure Guardar_R(var A_Res:ArchivoReserva;R_Res:TipoReserva);
begin
     seek(A_Res,filesize(A_Res));
     write(A_Res,R_Res);
end;

Procedure Busqueda_R(var A_Res:ArchivoReserva; Bus:integer; var Pos:integer;var R_Res:TipoReserva);
var P:integer;
Begin
     Pos:=-1;
     P:=0;
     seek(A_Res,0);
     While (Not eof (A_Res)) and (Pos=-1) do
     Begin
          Leer_R(A_Res,R_Res,P);
          If (Bus=R_Res.ID_Reserva) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
     End;
End;

procedure Cargar_R(var A_Res:ArchivoReserva; var V:TipoVectorReserva; var Cant:integer);
var p:integer;
begin
     Abrir_R(A_Res);
     p:=0;
     Cant:=0;
     while(not eof(A_Res)) do
     begin
          Leer_R(A_Res, Reg_R, p);
          if(Reg_R.Activo) then
          begin
                inc(Cant);
                V[Cant].ID_Reserva := Reg_R.ID_Reserva;
                V[Cant].pos:= p;
          end;
          inc(p);
     end;
     Cerrar_R(A_Res);
end;

Procedure Burbuja_R(var V:TipoVectorReserva; var Cant:integer);
Var I,J:byte;
    Aux:TipoReservaBB;
Begin
     For I:= 1 to (Cant-1) do //recorridas
     Begin
          For J:= 1 to (Cant-I) do //comparaciones
          Begin
               If (V[J].ID_Reserva)>(V[J+1].ID_Reserva) then
               Begin
                    Aux:=V[J];
                    V[J]:=V[J+1];
                    V[J+1]:=Aux;
               End;
          End;
     End;
End;


//Procedimientos de Pasajeros:
Procedure Abrir_P(var A_Pasaj:ArchivoPasajero);
begin
     Assign(A_Pasaj,'C:\Trabajo practico final - Aerolineas\Datos\DatosDePasajeros.dat');
     Reset(A_Pasaj);
     If (ioresult <> 0) then
     Rewrite(A_Pasaj);
end;

Procedure Cerrar_P(var A_Pasaj:ArchivoPasajero);
begin
     Close(A_Pasaj)
end;

procedure Leer_P(var A_Pasaj:ArchivoPasajero; var R_Pasaj:TipoPasajero; Pos:integer);
begin
     seek(A_Pasaj,Pos);
     read(A_Pasaj,R_Pasaj);
end;

Procedure Modificar_P(var A_Pasaj:ArchivoPasajero; Pos:integer; R_Pasaj:TipoPasajero);
begin
     seek(A_Pasaj,Pos);
     write(A_Pasaj,R_Pasaj);
end;

Procedure Guardar_P(var A_Pasaj:ArchivoPasajero;R_Pasaj:TipoPasajero);
begin
     seek(A_Pasaj,filesize(A_Pasaj));
     write(A_Pasaj,R_Pasaj);
end;

Procedure Busqueda_P(var A_Pasaj:ArchivoPasajero; Bus:integer; var Pos:integer;var R_Pasaj:TipoPasajero);
var P:integer;
Begin
     Pos:=-1;
     P:=0;
     seek(A_Pasaj,0);
     While (Not eof (A_Pasaj)) and (Pos=-1) do
     Begin
          Leer_P(A_Pasaj,R_Pasaj,P);
          If (Bus=R_Pasaj.ID_Pasajero) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
     End;
End;

procedure Cargar_P(var A_Pasaj:ArchivoPasajero; var V:TipoVectorPasajero; var Cant:integer);
var p:integer;
begin
     Abrir_P(A_Pasaj);
     p:=0;
     Cant:=0;
     while(not eof(A_Pasaj)) do
     begin
          Leer_P(A_Pasaj, Reg_P, p);
          if(Reg_P.Activo) then
          begin
                inc(Cant);
                V[Cant].Apellido := Reg_P.Apellido;
                V[Cant].Nombre := Reg_P.Nombre;
                V[Cant].Pos :=  p;
          end;
          inc(p);
     end;
     Cerrar_P(A_Pasaj);
end;

Procedure Burbuja_P(var V:TipoVectorPasajero; var Cant:integer);
Var I,J:byte;
    Aux:TipoPasajeroBB;
Begin
     For I:= 1 to (Cant-1) do //recorridas
     Begin
          For J:= 1 to (Cant-I) do //comparaciones
          Begin
               If ((V[J].Apellido)+(V[J].Nombre))>((V[J+1].Apellido)+(V[J+1].Nombre)) then
               Begin
                    Aux:=V[J];
                    V[J]:=V[J+1];
                    V[J+1]:=Aux;
               End;
          End;
     End;
End;


//Procedimientos de LineaAerea:
Procedure Abrir_LA(var A_LA:ArchivoLineaAerea);
begin
     Assign(A_LA,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeLineasAereas.dat');
     Reset(A_LA);
     If (ioresult <> 0) then
     Rewrite(A_LA);
end;

Procedure Cerrar_LA(var A_LA:ArchivoLineaAerea);
begin
     Close(A_LA)
end;

procedure Leer_LA(var A_LA:ArchivoLineaAerea; var R_LA:TipoLineaAerea; Pos:integer);
begin
     seek(A_LA,Pos);
     read(A_LA,R_LA);
end;

Procedure Modificar_LA(var A_LA:ArchivoLineaAerea; Pos:integer; R_LA:TipoLineaAerea);
begin
     seek(A_LA,Pos);
     write(A_LA,R_LA);
end;

Procedure Guardar_LA(var A_LA:ArchivoLineaAerea;R_LA:TipoLineaAerea);
begin
     seek(A_LA,filesize(A_LA));
     write(A_LA,R_LA);
end;

Procedure Busqueda_LA(var A_LA:ArchivoLineaAerea; Bus:string; var Pos:integer; var R_LA:TipoLineaAerea; var ID:integer);

var P:integer;

Begin
     Pos:=-1;
     P:=0;
     While (Not eof (A_LA)) and (Pos=-1) do
     Begin
          Leer_LA(A_LA,R_LA,P);
          If (Bus=R_LA.Nombre) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
          ID:=P;
     End;
End;

procedure Cargar_LA(var A_LA:ArchivoLineaAerea; var V:TipoVectorLineaAerea; var Cant:integer);
var p:integer;
begin
     Abrir_LA(A_LA);
     p:=0;
     Cant:=0;
     while(not eof(A_LA)) do
     begin
          Leer_LA(A_LA, RegistroLineaAereaV, p);
          if(RegistroLineaAereaV.Activo) then
          begin
                inc(Cant);
                V[Cant].Nombre := RegistroLineaAereaV.Nombre;
                V[Cant].pos :=  p;
          end;
          inc(p);
     end;
     Cerrar_LA(A_LA);
end;

Procedure Burbuja_LA(var V:TipoVectorLineaAerea; var Cant:integer);
Var I,J:byte;
    Aux:TipoLineaAereaBB;
Begin
     For I:= 1 to (Cant-1) do //recorridas
     Begin
          For J:= 1 to (Cant-I) do //comparaciones
          Begin
               If (V[J].Nombre)>(V[J+1].Nombre) then
               Begin
                    Aux:=V[J];
                    V[J]:=V[J+1];
                    V[J+1]:=Aux;
               End;
          End;
     End;
End;


//Procedimientos de Aeropuerto:
Procedure Abrir_A(var A_Aero:ArchivoAeropuerto);
begin
     Assign(A_Aero,'C:\Trabajo practico final - Aerolineas\Datos\DatosDeAeropuertos.dat');
     Reset(A_Aero);
     If (ioresult <> 0) then
     Rewrite(A_Aero);
end;

Procedure Cerrar_A(var A_Aero:ArchivoAeropuerto);
begin
     Close(A_Aero)
end;

procedure Leer_A(var A_Aero:ArchivoAeropuerto; var R_Aero:TipoAeropuerto; Pos:integer);
begin
     seek(A_Aero,Pos);
     read(A_Aero,R_Aero);
end;

Procedure Modificar_A(var A_Aero:ArchivoAeropuerto; Pos:integer; R_Aero:TipoAeropuerto);
begin
     seek(A_Aero,Pos);
     write(A_Aero,R_Aero);
end;

Procedure Guardar_A(var A_Aero:ArchivoAeropuerto;R_Aero:TipoAeropuerto);
begin
     seek(A_Aero,filesize(A_Aero));
     write(A_Aero,R_Aero);
end;

Procedure Busqueda_A(var A_Aero:ArchivoAeropuerto; var Pos:integer;Bus:string; var R_Aero:TipoAeropuerto; var ID:Integer);
var P:integer;

Begin
     Pos:=-1;
     P:=0;
     While (Not eof (A_Aero)) and (Pos=-1) do
     Begin
          Leer_A(A_Aero,R_Aero,P);
          If (Bus=R_Aero.Nombre) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
          ID:=P;
     End;
End;

procedure Cargar_A(var A_Aero:ArchivoAeropuerto; var V:TipoVectorAero; var Cant:integer);
var p:integer;
begin
     Abrir_A(A_Aero);
     p:=0;
     Cant:=0;
     while(not eof(A_Aero)) do
     begin
          Leer_A(A_Aero, Reg_A, p);
          if(Reg_A.Activo) then
          begin
                inc(Cant);
                V[Cant].Nombre := Reg_A.Nombre;
                V[Cant].Pais := Reg_A.Pais;
                V[Cant].Ciudad := Reg_A.Ciudad;
                V[Cant].pos :=  p;
          end;
          inc(p);
     end;
     Cerrar_A(A_Aero);
end;

Procedure Burbuja_A(var V:TipoVectorAero; var Cant:integer);
Var I,J:byte;
    Aux:TipoAeroBB;
Begin
	
     For I:= 1 to (Cant-1) do //recorridas
     Begin
          For J:= 1 to (Cant-I) do //comparaciones
          Begin
               If ((V[J].ID_Aeropuerto)+(V[J].Pais)+(V[J].Ciudad)+(V[J].Nombre))>((V[J].ID_Aeropuerto)+(V[J+1].Pais)+(V[J+1].Ciudad)+(V[J+1].Nombre)) then
               Begin
                    Aux:=V[J];
                    V[J]:=V[J+1];
                    V[J+1]:=Aux;
               End;
          End;
     End;
End;

Begin
End.
