Unit Unit_Animacion;

interface

uses crt,Unit_Menu;

Procedure Animacion();

implementation

Procedure Animacion();

var I:byte;

begin
     TextColor(white);
     TextBackground(Black);
     for I := 1 to 50 do
     begin
     GotoXY(5+I,4);
     Writeln('                              -s-');
     GotoXY(5+I,5);
     Writeln('                                sMy`');
     GotoXY(5+I,6);
     Writeln('                                  hMm-');
     GotoXY(5+I,7);
     Writeln('                                  `mMN/');
     GotoXY(5+I,8);
     Writeln('                                   -NMMs`');
     GotoXY(5+I,9);
     Writeln('                                    +MMMd.');
     GotoXY(5+I,10);
     Writeln('                                    sMMMN:...`');
     GotoXY(5+I,11);
     Writeln('                 /y:                `mMMMMNmd:');
     GotoXY(5+I,12);
     Writeln('                 .NMs`              `sMMMMMh.');
     GotoXY(5+I,13);
     Writeln('                  +MMd:-::++oosssssssdMMMMMMmyssssssssso/DDD:.');
     GotoXY(5+I,14);
     Writeln('                 :oMMMNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNhDDDDD-');
     GotoXY(5+I,15);
     Writeln('                  +MMh---:/+++++++ooosMMMMMMdoooooooo++/-DDD.`');
     GotoXY(5+I,16);
     Writeln('                 .NMs`              `yMMMMMd-`');
     GotoXY(5+I,17);
     Writeln('                 :y:                -NMMMNmdd:');
     GotoXY(5+I,18);
     Writeln('                                   `hMMMm:```');
     GotoXY(5+I,19);
     Writeln('                                   oMMMh.');
     GotoXY(5+I,20);
     Writeln('                                  /MMMo`');
     GotoXY(5+I,21);
     Writeln('                                 `NMN:');
     GotoXY(5+I,22);
     Writeln('                                `dMd.');
     GotoXY(5+I,23);
     Writeln('                                sMy`');
     GotoXY(5+I,24);
     Writeln('                              -s-');
     GotoXY(5,11);
     Writeln('"Nada mas seguro que una aerolinea llamada "Peligro"');
     GotoXY(5,12);
     Writeln('');
     GotoXY(5,13);
     Writeln('Aerolineas "Peligro"' );
     GotoXY(5,14);
     Writeln('Integrantes:');
     GotoXY(5,15);
     Writeln('Ibacache Tiago Alan Jesus');
     GotoXY(5,16);
     Writeln('Rivero Juan Antonio');
     GotoXY(5,17);
     Writeln('Soria Lucas Ezequiel');
     TextColor(White);
     end;
          Menu_Principal();
End;

begin
end.
