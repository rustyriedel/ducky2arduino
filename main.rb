require_relative "./hashes"
require_relative "./funcs"

$errorFlag = false
$inputFileName = nil
$outputFileName = nil

def translateFile()
  #create arduino C file
  $file = File.new($outputFileName, "w+")

#write header and library info to file
  $file.write("#include \"Keyboard.h\"\n\n")
  $file.write("void setup(){\n")
  $file.write("\t//Start keyboard\n")
  $file.write("\tKeyboard.begin();\n\n")
  $file.write("\t//Start Payload\n")

#parse the ducky Script input file
  lines = IO.readlines($inputFileName)
  lineNum = 0
  lines.each do |line|
    lineNum += 1
    #check if line is empty
    if !line.strip.empty?
      #check if next line is repeat and process accordingly
      nextLine = lines[lineNum]
      #test if next line is valid
      if nextLine
        if lines[lineNum].split.first == "REPEAT"
          startRepeat(nextLine)
        end
      end

      #process the command
      command = $keywords[line.split.first.to_sym]
      if command == nil
        #error message for undefined commands
        puts "ERROR: \"#{line.split.first}\" on line #{lineNum} is undefined."
        $errorFlag = true
      else
        #call function for valid command
        command.call(line)
      end
    end
  end

#write the end of the arduino C file and close it
  $file.write("\t//Stop keyboard\n")
  $file.write("\tKeyboard.end();\n")
  $file.write("}\n\n")
  $file.write("void loop(){\n}\n")
  $file.close

#end of parse status output
  if $errorFlag
    puts "A problem occured in translation. Please see details above."
    File.delete($outputFileName)
  else
    puts "Translation completed successfully!"
  end
end

#get cli info and verify input and output filenames
#check if input file arg is present
if ARGV[0] == nil
  puts "No input file detected."
else
  #set the input filename
  $inputFileName = ARGV[0]

  #check if otput file arg is present
  if ARGV[1] == nil
    $outputFileName = $inputFileName.split('.').first + ".c"
    puts "No output file specified, output will be saved as #{$outputFileName}"
  else
    $outputFileName = ARGV[1]
  end

  #translate the input file to arduino C
  translateFile
end




