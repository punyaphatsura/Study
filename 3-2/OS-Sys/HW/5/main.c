#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <stdlib.h>

void *print_message(void *msg)
{
    char *message = (char *)msg;
    printf("%s\n", message);
    return NULL;
}

void *child_process(void *arg)
{
    // Thread 1 in child process
    pthread_t t1, t2;
    pthread_create(&t1, NULL, print_message, "First thread from child process");
    pthread_create(&t2, NULL, print_message, "Second thread from child process");

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    return NULL;
}

int main()
{
    pthread_t parent_t1, parent_t2;

    // Thread 1 in parent process
    pthread_create(&parent_t1, NULL, print_message, "First thread from parent process");

    // Thread 2 in parent process
    pthread_create(&parent_t2, NULL, print_message, "Second thread from parent process");

    pthread_join(parent_t1, NULL);
    pthread_join(parent_t2, NULL);

    // Create a child process
    pid_t child_pid = fork();

    if (child_pid == 0)
    {
        // This is the child process
        child_process(NULL);
    }
    else if (child_pid < 0)
    {
        perror("Error creating child process");
        exit(EXIT_FAILURE);
    }

    return 0;
}
