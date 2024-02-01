#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <thread.h>
#include <ztimer.h>
#include <shell.h>
#include <mutex.h>
#include <lpsxxx.h>
#include <lpsxxx_params.h>

// Adding lps331ap device variable
static lpsxxx_t lps_sensor;
static void Usage(char *cmd)
{
    printf("Usage: %s <temperature|pressure|start/stop>\n", cmd);
}

static int lps_handler(int arg_count, char *arg_values[])
{
    if (arg_count < 2) {
        Usage(arg_values[0]);
        return -1;
    }

    while (1) {
        // Implementing the lps331ap temperature/pressure subcommands
        if (!strcmp(arg_values[2], "stop")) {
            return -1;
        } else if (!strcmp(arg_values[1], "temperature")) {
            int16_t temp = 0;
            lpsxxx_read_temp(&lps_sensor, &temp);
            printf("Temperature: %i.%u°C\n", (temp / 100), (temp % 100));
        } else if (!strcmp(arg_values[1], "pressure")) {
            uint16_t pres = 0;
            lpsxxx_read_pres(&lps_sensor, &pres);
            printf("Pressure: %uhPa\n", pres);
        } else {
            Usage(arg_values[0]);
            return -1;
        }
        // uint32_t(arg[1]);
        ztimer_sleep(ZTIMER_MSEC, 2000);
    }

    return 0;
}

static const shell_command_t commands[] = {

    { "lps", "Read the LPS331AP sensor values", lps_handler },

    { NULL, NULL, NULL}
};

int main(void)
{
    // Initializing the lps331ap sensor
    lpsxxx_init(&lps_sensor, &lpsxxx_params[0]);

    // Starting the shell now
    char shell_input_buffer[SHELL_DEFAULT_BUFSIZE];
    shell_run(commands, shell_input_buffer, SHELL_DEFAULT_BUFSIZE);

    return 0;
}
