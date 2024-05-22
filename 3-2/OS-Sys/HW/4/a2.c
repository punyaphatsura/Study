#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

int tokenize(char *string, char *delimiters, char ***arrayOfTokens);

int main()
{
    int run = 1;
    while (run)
    {
        printf("mysh >");

        char input[256];
        fgets(input, 256, stdin);

        // Remove newline character from input
        input[strcspn(input, "\n")] = 0;

        char delim[] = " \t\n";
        char **tokens;
        int numtokens;

        // 1. use tokenize() function to get command
        numtokens = tokenize(input, delim, &tokens);

        if (strcmp(input, "exit") == 0)
        {
            run = 0;
        }
        else
        {
            if (numtokens > 0)
            {
                // 2. fork a child process
                pid_t pid = fork();

                if (pid < 0)
                {
                    perror("Fork failed: pid < 0\n");
                    exit(1);
                }
                else if (pid == 0)
                {
                    // 3. child use execvp to run command
                    execvp(tokens[0], tokens);
                }
                else
                {
                    // 4. parent call wait() until user enter exit
                    wait(NULL);
                }
            }
        }
    }

    return 0;
}

int tokenize(char *string, char *delimiters, char ***arrayOfTokens)
{
    char *token;
    int numtokens;
    int i;
    /* skip the beginning delimiters */
    string += strspn(string, delimiters);
    if ((token = malloc(strlen(string) + 1)) == NULL)
        return -1;
    /* count tokens */
    strcpy(token, string);
    numtokens = 0;
    if (strtok(token, delimiters) != NULL)
        for (numtokens = 1; strtok(NULL, delimiters) != NULL;
             numtokens++)
            ;
    /* create array of pointers to tokens */
    if ((*arrayOfTokens = malloc((numtokens + 1) * sizeof(char *))) ==
        NULL)
    {
        free(token);
        return -1;
    }
    /* fill pointers to tokens into the array */
    if (numtokens == 0)
        free(token);
    else
    {
        strcpy(token, string);
        (*arrayOfTokens)[0] = strtok(token, delimiters);
        for (i = 1; i < numtokens; i++)
            (*arrayOfTokens)[i] = strtok(NULL, delimiters);
        (*arrayOfTokens)[numtokens] = NULL;
    }
    return numtokens;
}
