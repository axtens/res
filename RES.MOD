MODULE RES;

FROM Windows IMPORT Window, OpenWindow, SelectWindow, CloseWindow,
                    CloseCurWindow, NewWindowTitle;
FROM Display IMPORT DisplayString, Goto;

FROM Menu IMPORT PopMenu;
(* FROM NumberConversion *)
FROM Strings IMPORT Append;

FROM InOut IMPORT WriteString, WriteLine, Read;


VAR
        RESmain : Window;
        cmd1 : CARDINAL;
        RESmainmenu : ARRAY [0..255] OF CHAR;

PROCEDURE PAWS( r, c, a : CARDINAL);
VAR
        ch : CHAR;
BEGIN
        DisplayString("Press [SPACE].",r,c,a);
        Goto(r,c+15);
        Read(ch)
END PAWS;

PROCEDURE BookIn;
VAR
        BookInWindow : Window;
BEGIN
        OpenWindow(BookInWindow,10,10,15,70,TRUE,"BookIn");
        PAWS(2,1,7);
        CloseWindow(BookInWindow);
END BookIn;

PROCEDURE BookOut;
VAR
        BookOutWindow : Window;
BEGIN
        OpenWindow(BookOutWindow,10,10,15,70,TRUE,"BookOut");
        PAWS(2,1,7);
        CloseWindow(BookOutWindow);
END BookOut;

PROCEDURE Reports;
VAR
        ReportsWindow : Window;
BEGIN
        OpenWindow(ReportsWindow,10,10,15,70,TRUE,"Reports");
        PAWS(2,1,7);
        CloseWindow(ReportsWindow);
END Reports;

PROCEDURE Queries;
VAR
        QueriesWindow : Window;
BEGIN
        OpenWindow(QueriesWindow,10,10,15,70,TRUE,"Queries");
        PAWS(2,1,7);
        CloseWindow(QueriesWindow);
END Queries;

PROCEDURE Parts;
VAR
        PartsWindow : Window;
BEGIN
        OpenWindow(PartsWindow,10,10,15,70,TRUE,"Parts");
        PAWS(2,1,7);
        CloseWindow(PartsWindow);
END Parts;

PROCEDURE Maintenance;
VAR
        MaintenanceWindow : Window;
BEGIN
        OpenWindow(MaintenanceWindow,10,10,15,70,TRUE,"Maintenance");
        PAWS(2,1,7);
        CloseWindow(MaintenanceWindow);
END Maintenance;

PROCEDURE Backup;
VAR
        BackupWindow : Window;
BEGIN
        OpenWindow(BackupWindow,10,10,15,70,TRUE,"Backup");
        PAWS(2,1,7);
        CloseWindow(BackupWindow);
END Backup;

PROCEDURE DrawMainScreen;
BEGIN
        OpenWindow( RESmain, 0, 0, 24, 79, TRUE, "Rivervale Electronic Services");
END DrawMainScreen;

PROCEDURE SetupMenus;
BEGIN
RESmainmenu :="MAIN MENU|I - INCOMING REPAIR|C - COMPLETED REPAIRS";
Append(RESmainmenu,"|R - REPORTS|Q - QUERIES|P - PARTS|B - BACKUP");
Append(RESmainmenu,"|S - SYSTEM MAINTENANCE|X - eXit");
END SetupMenus;

PROCEDURE SetupPickLists;
BEGIN
END SetupPickLists;

PROCEDURE SetupDataFiles;
BEGIN
END SetupDataFiles;

PROCEDURE SetupWindows;
BEGIN
END SetupWindows;


BEGIN
        SetupMenus;
        SetupPickLists;
        SetupDataFiles;
        SetupWindows;
        DrawMainScreen;
        LOOP
                PopMenu(5,20,RESmainmenu,12,TRUE,cmd1);
                IF cmd1 = 8 THEN EXIT END;
                CASE cmd1 OF
                        1 : BookIn;
                        |
                        2 : BookOut;
                        |
                        3 : Reports;
                        |
                        4 : Queries;
                        |
                        5 : Parts;
                        |
                        6 : Backup;
                        |
                        7 : Maintenance
                END;
        END;
        CloseCurWindow;


END RES.
