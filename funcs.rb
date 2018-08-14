#used to indent for loops
$tabToggle = false

def getKeyId(key)
  id = $keys[key.to_sym]
  if id == nil
    return key.ord
  else
    return id
  end
end

def keypress(key)
  $file.write("#{"\t" if $tabToggle}\tKeyboard.press(#{key});\n")
end

def parseCommand(command)
  first = command.split[0]
  last = command.split.drop(1).join(' ')
  if first
    keypress(getKeyId(first))
  end
  if !last.empty?
    parseCommand(last)
  end
end

def release
  $file.write("#{"\t" if $tabToggle}\tKeyboard.releaseAll();\n#{"\n" unless $tabToggle}")
end

#opens a for loop, when the REPEAT command is read it will close the loop
def startRepeat(command)
  $tabToggle = true
  $file.write("\tfor(int i = 0; i < #{command.split[1]}; i++){\n")
end