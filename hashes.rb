ASCII_OFFSET = 136
DEFAULT_DELAY_FLAG = false
DEFAULT_DELAY_TIME = 0

$keys = {
    CONTROL:"KEY_LEFT_CTRL",
    SHIFT:"KEY_LEFT_SHIFT",
    ALT:"KEY_LEFT_ALT",
    GUI:"KEY_LEFT_GUI",
    UP:"KEY_UP_ARROW",
    DOWN:"KEY_DOWN_ARROW",
    LEFT:"KEY_LEFT_ARROW",
    RIGHT:"KEY_RIGHT_ARROW",
    BACKSPACE:"KEY_BACKSPACE",
    TAB:"KEY_TAB",
    ENTER:"KEY_RETURN",
    ESC:"KEY_ESC",
    INSERT:"KEY_INSERT",
    DELETE:"KEY_DELETE",
    PAGEUP:"KEY_PAGE_UP",
    PAGEDOWN:"KEY_PAGE_DOWN",
    HOME:"KEY_HOME",
    END:"KEY_END",
    CAPSLOCK:"KEY_CAPS_LOCK",
    F1:"KEY_F1",
    F2:"KEY_F2",
    F3:"KEY_F3",
    F4:"KEY_F4",
    F5:"KEY_F5",
    F6:"KEY_F6",
    F7:"KEY_F7",
    F8:"KEY_F8",
    F9:"KEY_F9",
    F10:"KEY_F10",
    F11:"KEY_F11",
    F12:"KEY_F12",
    PAUSE:"#{ASCII_OFFSET + 72}",
    NUMLOCK:"#{ASCII_OFFSET + 83}",
    PRINTSCREEN:"#{ASCII_OFFSET + 70}",
    SCROLLLOCK:"#{ASCII_OFFSET + 71}",
    SPACE:"32",
    MENU:"229",
}

#functions
binds = {
    rem:lambda {|x| $file.write("\t//#{x.split.drop(1).join(' ')}\n")},
    delay:lambda {|x| $file.write("#{"\t" if $tabToggle}\tdelay(#{x.split[1]});\n")},
    string:lambda {|x| $file.write("#{"\t" if $tabToggle}\tKeyboard.print(\"#{x.split.drop(1).join(' ')}\");\n")},
    defaultDelay:lambda do |x|
      if !DEFAULT_DELAY_FLAG
        DEFAULT_DELAY_TIME = x.split[1]
        DEFAULT_DELAY_FLAG = true
      else
        #error message for additional default delay declerations
        puts "DEFAULT_DELAY is already defined as #{DEFAULT_DELAY_TIME}"
      end
    end,
    repeat:lambda do |x|
      $tabToggle = false
      $file.write("\t}\n\n")
    end,
    default:lambda do |x|
      keypress(getKeyId(x.split.first))
      parseCommand(x.split.drop(1).join(' '))
      release
    end,
}

#hash of duckyscript keywords to function binds
$keywords = {
    DEFAULT_DELAY:binds[:defaultDelay],
    DEFAULTDELAY:binds[:defaultDelay],
    DELAY:binds[:delay],
    STRING:binds[:string],
    REM:binds[:rem],
    REPEAT:binds[:repeat],

    #commands that require no processing => default function
    GUI:binds[:default],
    WINDOWS:binds[:default],
    MENU:binds[:default],
    APP:binds[:default],
    SHIFT:binds[:default],
    ALT:binds[:default],
    CONTROL:binds[:default],
    CTRL:binds[:default],
    ENTER:binds[:default],
    DOWNARROW:binds[:default],
    DOWN:binds[:default],
    LEFTARROW:binds[:default],
    LEFT:binds[:default],
    RIGHTARROW:binds[:default],
    RIGHT:binds[:default],
    UPARROW:binds[:default],
    UP:binds[:default],
    BREAK:binds[:default],
    PAUSE:binds[:default],
    CAPSLOCK:binds[:default],
    DELETE:binds[:default],
    END:binds[:default],
    ESC:binds[:default],
    ESCAPE:binds[:default],
    HOME:binds[:default],
    INSERT:binds[:default],
    NUMLOCK:binds[:default],
    PAGEUP:binds[:default],
    PAGEDOWN:binds[:default],
    PRINTSCREEN:binds[:default],
    SCROLLLOCK:binds[:default],
    SPACE:binds[:default],
    TAB:binds[:default],
}

