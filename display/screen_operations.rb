def message(msg,use_clear_screen = true, use_timer = true,timer = 2)
    clear_screen if use_clear_screen
    puts msg
    sleep(timer) if use_timer
    clear_screen if use_clear_screen
end

def clear_screen
    if Gem.win_platform?
        system("cls")
    else
        system("clear")
    end
end

def green_message(msg,use_clear_screen = true, use_timer = true,timer = 2)
    msg = green(msg)
    message(msg,use_clear_screen,use_timer,timer)
end

def red_message(msg,use_clear_screen = true, use_timer = true,timer = 2)
    msg = red(msg)
    message(msg,use_clear_screen,use_timer,timer)
end

def yellow_message(msg,use_clear_screen = true, use_timer = true,timer = 2)
    msg = blue(msg)
    message(msg,use_clear_screen,use_timer,timer)
end

def blue_message(msg,use_clear_screen = true, use_timer = true,timer = 2)
    msg = blue(msg)
    message(msg,use_clear_screen,use_timer,timer)
end

def green(msg)
    "\e[32m#{msg}\e[0m"
end

def red(msg)
    "\e[31m#{msg}\e[0m"
end

def yellow(msg)
    "\e[33m#{msg}\e[0m"
end

def blue(msg)
    "\e[34m#{msg}\e[0m"
end