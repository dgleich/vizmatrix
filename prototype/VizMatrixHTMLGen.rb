filename = "orig.html"

table = ""

x = 800
y = 600

cellsize = 1

threshold = 0.1

file = File.new(filename,"r")
html = ""
while (line = file.gets):
    html += line
end

i = 0
j = 0

while ( i < x ):
    j = 0
    table << "  <div class=\"line\">"
    while ( j < y ):
        style = "white"
        value = 0
        if (rand(0) < threshold ):
            style = "blue"
            value = rand(1000);
        end
        
        table << ('<div class="' + style + "\" value=\"" + value.to_s + "\" i=\"" + i.to_s + "\" j=\"" + j.to_s + "\">&nbsp;</div>")
        j += 1
    end
    table << "</div>"
    i += 1
end

html.sub!(/TABLE DATA/) { table }

html.gsub!(/CELLSIZE/) { cellsize }

puts html
