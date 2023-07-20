// os/kernel.cpp
void printf(const char *str)
{
    // screen address
    static uint16_t *VideoMemory = (uint16_t*)0xb8000;
    static uint8_t x = 0, y = 0;

    for (int i = 0; str[i]; i++)
    {
        switch (str[i])
        {
            case '\n':
                y++;
                x = 0;
                break;
            default:
                VideoMemory[80 * y + x] = (VideoMemory[80 * y + x] & 0xFF00) | str[i];
                x++;
        }

        if (x >= 80)
        {
            x = 0;
            y++;
        }
        if (y >= 25)
        {
            for (y = 0; y < 25; y++)
            {
                for (x = 0; x < 80; x++)
                    VideoMemory[i] = (VideoMemory[i] & 0xFF00) | ' ';
            }
            x = 0;
            y = 0;
        }
    }
}