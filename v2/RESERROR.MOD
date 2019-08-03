IMPLEMENTATION MODULE RESerrors;
FROM InOut IMPORT WriteString, WriteLine;
FROM System IMPORT Terminate;

PROCEDURE RESerror( err : RESerrorcodes;
                    msg : ARRAY OF CHAR;
                    lev : RESerrorlevel);

BEGIN
        WriteString("RES Error [");
        CASE err OF
                USERERROR : IF lev = WARNING THEN
                                WriteString("WARNING]: ")
                            ELSE
                                WriteString("FATAL]: ")
                            END;
                            WriteLine(msg);
                            IF lev = FATAL THEN
                                Terminate(1)
                            END;
                            |
                NOENVAR :   WriteString("FATAL]: Environment variable ");
                            WriteString(msg);
                            WriteLine(" not found.");
                            Terminate(1);
                            |
                NOMEMAVAIL : WriteString("FATAL]: No memory available for ");
                            WriteString(msg);
                            Terminate(1);
                            |
                NOFILEFOUND : WriteString("FATAL]: File ");
                            WriteString(msg);
                            WriteLine(" not found.");
                            Terminate(1);
                            |

                FILEEMPTY : WriteString("FATAL]: File ");
                            WriteString(msg);
                            WriteLine(" empty.");
                            Terminate(1);
                            |

                PICKLIMITERROR : WriteString("FATAL]: Too many entries in picklist ");
                            WriteString(msg);
                            Terminate(1);
        END;

END RESerror;
END RESerrors.




