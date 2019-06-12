Unit Unit_Interfaz;

Interface

Uses crt,Unit_Sonido;

Procedure InterfazPrincipal;
Procedure InterfazAltas;
Procedure InterfazBajas;
Procedure InterfazModificaciones;
Procedure InterfazReactivaciones;
Procedure InterfazAux;
Procedure InterfazConsultas();

implementation

Procedure InterfazPrincipal();
Begin
	 window(1,1,105,51);
     TextColor(11);
     GotoXY(13,3);
     Writeln('_____________________________________________________________________________________________');			  
     GotoXY(13,4);
     Writeln('|                                                                                           |');
     GotoXY(13,5);
     Writeln('|                                                                                           |');
     GotoXY(13,6);
     Writeln('|                                                                                           |');
     GotoXY(13,7);
     Writeln('|___________________________________________________________________________________________|');
     GotoXY(13,8);
     Writeln('|                                                                                           |');
     GotoXY(13,9);
     Writeln('|                                                                                           |');
     GotoXY(13,10);
     Writeln('|                                                                                           |');
     GotoXY(13,11);
     Writeln('|                                                                                           |');
     GotoXY(13,12);
     Writeln('|                                                                                           |');
     GotoXY(13,13);
     Writeln('|                                                                                           |');
     GotoXY(13,14);
     Writeln('|                                                                                           |');
     GotoXY(13,15);
     Writeln('|                                                                                           |');
     GotoXY(13,16);
     Writeln('|                                                                                           |');
     GotoXY(13,17);
     Writeln('|                                                                                           |');
     GotoXY(13,18);
     Writeln('|                                                                                           |');
     GotoXY(13,19);
     Writeln('|                                                                                           |');
     GotoXY(13,20);
     Writeln('|                                                                                           |');
     GotoXY(13,21);
     Writeln('|                                                                                           |');
     GotoXY(13,22);
     Writeln('|                                                                                           |');
     GotoXY(13,23);
     Writeln('|                                                                                           |');
     GotoXY(13,24);
     Writeln('|                                                                                           |');
     GotoXY(13,25);
     Writeln('|                                                                                           |');
     GotoXY(13,26);
     Writeln('|                                                                                           |');
     GotoXY(13,27);
     Writeln('|___________________________________________________________________________________________|');
     HighVideo;
     TextColor(15);
     TextBackground(0);
End;


Procedure InterfazAltas;
Begin
	 InterfazAux;
     TextColor(12);
     TextBackground(0);
     HighVideo;
     GotoXY(45,12);
     Writeln('________________________________');
     GotoXY(45,13);
     Writeln('|                              |');
     GotoXY(45,14);
     Writeln('|                              |');
     GotoXY(45,15);
     Writeln('|                              |');
     GotoXY(45,16);
     Writeln('|______________________________|');
     GotoXY(47,14);
     Writeln('       Alta realizada');
     Delay(1000);
     GotoXY(47,14);
     Writeln('Oprima enter para continuar.');
     SonidoError3();
     Readkey;
     NormVideo;
     TextColor(15);
     TextBackground(0);
End;

Procedure InterfazBajas;
Begin
     InterfazAux;
     TextColor(12);
     TextBackground(0);
     HighVideo;
     GotoXY(45,12);
     Writeln('________________________________');
     GotoXY(45,13);
     Writeln('|                              |');
     GotoXY(45,14);
     Writeln('|                              |');
     GotoXY(45,15);
     Writeln('|                              |');
     GotoXY(45,16);
     Writeln('|______________________________|');
     GotoXY(47,14);
     Writeln('       Baja realizada');
     Delay(1000);
     GotoXY(47,14);
     Writeln('Oprima enter para continuar.');
     SonidoError3();
     Readkey;
     NormVideo;
     TextColor(15);
     TextBackground(0);
End;

Procedure InterfazModificaciones;

Begin
	 InterfazAux;
     TextColor(12);
     TextBackground(0);
     HighVideo;
     GotoXY(45,12);
     Writeln('________________________________');
     GotoXY(45,13);
     Writeln('|                              |');
     GotoXY(45,14);
     Writeln('|                              |');
     GotoXY(45,15);
     Writeln('|                              |');
     GotoXY(45,16);
     Writeln('|______________________________|');
     GotoXY(47,14);
     Writeln('   Modificacion realizada');
     Delay(1000);
     GotoXY(47,14);
     Writeln('Oprima enter para continuar.');
     SonidoError3();
     Readkey;
     NormVideo;
     TextColor(15);
     TextBackground(0);
End;

Procedure InterfazReactivaciones;
Begin
	 InterfazAux;
     TextColor(12);
     TextBackground(0);
     HighVideo;
     GotoXY(45,12);
     Writeln('________________________________');
     GotoXY(45,13);
     Writeln('|                              |');
     GotoXY(45,14);
     Writeln('|                              |');
     GotoXY(45,15);
     Writeln('|                              |');
     GotoXY(45,16);
     Writeln('|______________________________|');
     GotoXY(47,14);
     Writeln('   Reactivacion realizada');
     Delay(1000);
     GotoXY(47,14);
     Writeln('Oprima enter para continuar.');
     SonidoError3();
     Readkey;
     NormVideo;
     TextColor(15);
     TextBackground(0);
End;

Procedure InterfazAux();
Begin
	 window(1,1,105,51);
     TextColor(11);
     GotoXY(14,7);
     Writeln('___________________________________________________________________________________________');
     GotoXY(13,8);
     Writeln('|                                                                                           |');
     GotoXY(13,9);
     Writeln('|                                                                                           |');
     GotoXY(13,10);
     Writeln('|                                                                                           |');
     GotoXY(13,11);
     Writeln('|                                                                                           |');
     GotoXY(13,12);
     Writeln('|                                                                                           |');
     GotoXY(13,13);
     Writeln('|                                                                                           |');
     GotoXY(13,14);
     Writeln('|                                                                                           |');
     GotoXY(13,15);
     Writeln('|                                                                                           |');
     GotoXY(13,16);
     Writeln('|                                                                                           |');
     GotoXY(13,17);
     Writeln('|                                                                                           |');
     GotoXY(13,18);
     Writeln('|                                                                                           |');
     GotoXY(13,19);
     Writeln('|                                                                                           |');
     GotoXY(13,20);
     Writeln('|                                                                                           |');
     GotoXY(13,21);
     Writeln('|                                                                                           |');
     GotoXY(13,22);
     Writeln('|                                                                                           |');
     GotoXY(13,23);
     Writeln('|                                                                                           |');
     GotoXY(13,24);
     Writeln('|                                                                                           |');
     GotoXY(13,25);
     Writeln('|                                                                                           |');
     GotoXY(13,26);
     Writeln('|                                                                                           |');
     GotoXY(13,27);
     Writeln('|___________________________________________________________________________________________|');
     HighVideo;
     TextColor(15);
     TextBackground(0);
End;

Procedure InterfazConsultas();

var i,j:integer;

begin
     TextColor(11);
     TextBackground(0);
     HighVideo;
     for i:= 2 to 99 do
     begin
     gotoxy(i,1);
     Write('_');
	 gotoxy(i,3);
     Write('_');
	 gotoxy(i,28);
     Write('_');
	 gotoxy(i,30);
     Write('_');
	 end;
     for j:= 2 to 30 do
     begin
     gotoxy(1,j);
     Write('|');
	 gotoxy(100,j);
     Write('|');
	 end;	
	 TextColor(white);
     TextBackground(0);
end;

BEGIN
END.

