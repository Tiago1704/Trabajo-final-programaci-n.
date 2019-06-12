Unit Unit_Sonido;

Interface

uses crt;

Procedure SonidoError();
Procedure SonidoError2();
Procedure SonidoError3();
Procedure SonidoError4();

Implementation

Procedure SonidoError();

begin
Sound(1000);
Delay(75);
Sound(10000);
Delay(75);
Sound(1000);
Delay(75);
NoSound;
end;

Procedure SonidoError2();

begin
Sound(4000);
Delay(75);
Sound(10000);
Delay(75);
Sound(4000);
Delay(100);
NoSound;
end;

Procedure SonidoError3();

begin
Sound(2000);
Delay(75);
Sound(10000);
Delay(75);
Sound(2000);
Delay(75);
NoSound;
end;

Procedure SonidoError4();

begin
Sound(2000);
Delay(75);
Sound(2000);
Delay(75);
Sound(2000);
Delay(75);
Sound(2000);
Delay(90);
NoSound;
end;


BEGIN
END.

