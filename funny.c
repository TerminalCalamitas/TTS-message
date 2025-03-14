#include <stdio.h>

char *streamerName = "Doug";
char messageType = 'a';

int main(int argc, char **argv)
{
    for (int i = 1; i < argc; i ++)
    {
        if (argv[i][0] == '-')
        {
            for (int j = 1; argv[i][j] != 0; j ++)
            {
                if (argv[i][j] == '-')
                {
                    printf("Preferred Usage: [executable] (options) (streamer name)\n");
                    printf("i.e. \"./out -b Parkzer\" will output \"Yay Parkzer, I'm worrisome that our fridenship is only parasocial, can you acknowledge this message so that it isn't anymore?\"\n");
                    printf("the order of arguments doesn't actually matter, however\n");
                    printf("\noptions must start with a single - to be recognized as an option\n");
                    printf("a:\toutput the default message\n");
                    printf("b:\toutput the funny message\n");
                    printf("c:\toutput the funniest message\n");
                    printf("-:\toutput this documentation, then TERMINATE PROGRAM WITHOUT MESSAGE\n");
                    printf("LIOS if multiple options are indicated\n");
                    printf("\nany argument not beginning with - will be recognized as the streamer name\n");
                    printf("LIOS if multiple non-option arguments are given\n");
                    printf("if no streamer name is given, it is default to \"Doug\"\n");
                    return (0);
                }
                if (argv[i][j] == 'a' || argv[i][j] == 'b' || argv[i][j] == 'c') messageType = argv[i][j];
            }
        }
        else
        {
            streamerName = argv[i];
        }
    }
    if (messageType == 'a') printf("Hey %s, I'm worried that our friendship is only parasocial, can you acknowledge this message so that it isn't anymore?", streamerName);
    if (messageType == 'b') printf("Yay %s, I'm worrisome that our fridenship is only parasocial, can you acknowledge this message so that it isn't anymore?", streamerName);
    if (messageType == 'c') printf("Hey %s, I'm worried that our friendship is only parasocial, can you acknowledge this message so that it isn't anymore? (OMEGALUL) You're blonde, bald, bad at 2d platformers, pissing in a toilet costume, shit king, poggies, dougina", streamerName);
    return (0);
}