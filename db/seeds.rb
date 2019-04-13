# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Part.find_or_create_by!(name: "Barrel Bottom (Metal)") do |part|
  part.part_id = "BBM"
end

Part.find_or_create_by!(name: "Barrel Bottom (Plastic)") do |part|
  part.part_id = "BBP"
end

Part.find_or_create_by!(name: "Barrel Top") do |part|
  part.part_id = "BT"
end

Part.find_or_create_by!(name: "Pocket Clip") do |part|
  part.part_id = "PC"
end

Part.find_or_create_by!(name: "Thruster") do |part|
  part.part_id = "THRUSTER"
end

Part.find_or_create_by!(name: "Cam") do |part|
  part.part_id = "CAM"
end

Part.find_or_create_by!(name: "Rubber Grip") do |part|
  part.part_id = "RG"
end

Part.find_or_create_by!(name: "Spring") do |part|
  part.part_id = "SPRING"
end

Part.find_or_create_by!(name: "Cartridge Body") do |part|
  part.part_id = "CB"
end

Part.find_or_create_by!(name: "Cartridge Cap") do |part|
  part.part_id = "CC"
end

Part.find_or_create_by!(name: "Writing Tip") do |part|
  part.part_id = "WT"
end

Part.find_or_create_by!(name: "Ink (Black)") do |part|
  part.part_id = "INK-BLACK"
end

Part.find_or_create_by!(name: "Ink (Red)") do |part|
  part.part_id = "INK-RED"
end

Part.find_or_create_by!(name: "Ink (Blue)") do |part|
  part.part_id = "INK-BLUE"
end

Part.find_or_create_by!(name: "Box Top") do |part|
  part.part_id = "BOX-TOP"
end

Part.find_or_create_by!(name: "Box Bottom") do |part|
  part.part_id = "BOX-BOTTOM"
end

Part.find_or_create_by!(name: "Box Insert") do |part|
  part.part_id = "BOX-INSERT"
end

a = Assembly.find_or_create_by!(name: "Pen Box") do |assembly|
  assembly.parts << Part.find_by_part_id("BOX-TOP")
  assembly.parts << Part.find_by_part_id("BOX-BOTTOM")
  assembly.parts << Part.find_by_part_id("BOX-INSERT")
end

a = Assembly.find_or_create_by!(name: "Barrel Top With Clip") do |assembly|
  assembly.parts << Part.find_by_part_id("BT")
  assembly.parts << Part.find_by_part_id("PC")
end

a = Assembly.find_or_create_by!(name: "Inkless Cartridge") do |assembly|
  assembly.parts << Part.find_by_part_id("CB")
  assembly.parts << Part.find_by_part_id("CC")
  assembly.parts << Part.find_by_part_id("WT")
end

a = Assembly.find_or_create_by!(name: "Ink Cartridge (Black)") do |assembly|
  assembly.parts << Part.find_by_part_id("INK-BLACK")
  Assembly.find_by_name("Inkless Cartridge").parent_assemblies << assembly
end

a = Assembly.find_or_create_by!(name: "Ink Cartridge (Blue)") do |assembly|
  assembly.parts << Part.find_by_part_id("INK-BLUE")
  Assembly.find_by_name("Inkless Cartridge").parent_assemblies << assembly
end

a = Assembly.find_or_create_by!(name: "Ink Cartridge (Red)") do |assembly|
  assembly.parts << Part.find_by_part_id("INK-RED")
  Assembly.find_by_name("Inkless Cartridge").parent_assemblies << assembly
end

a = Assembly.find_or_create_by!(name: "Inkless, Bottomless Pen") do |assembly|
  assembly.parts << Part.find_by_part_id("THRUSTER")
  assembly.parts << Part.find_by_part_id("CAM")
  assembly.parts << Part.find_by_part_id("SPRING")
  Assembly.find_by_name("Barrel Top With Clip").parent_assemblies << assembly
end


a = Assembly.find_or_create_by!(name: "Inkless Pen (Plastic)") do |assembly|
  assembly.parts << Part.find_by_part_id("BBP")
  Assembly.find_by_name("Inkless, Bottomless Pen").parent_assemblies << assembly
end

a = Assembly.find_or_create_by!(name: "Inkless Pen (Metal)") do |assembly|
  assembly.parts << Part.find_by_part_id("BBM")
  Assembly.find_by_name("Inkless, Bottomless Pen").parent_assemblies << assembly
end

Assembly.find_or_create_by!(name: "Pen (Red, Metal)") do |assembly|
  Assembly.find_by_name("Inkless Pen (Metal)").parent_assemblies << assembly
  Assembly.find_by_name("Ink Cartridge (Red)").parent_assemblies << assembly
end

Assembly.find_or_create_by!(name: "Pen (Blue, Metal)") do |assembly|
  Assembly.find_by_name("Inkless Pen (Metal)").parent_assemblies << assembly
  Assembly.find_by_name("Ink Cartridge (Blue)").parent_assemblies << assembly
end

Assembly.find_or_create_by!(name: "Pen (Black, Metal)") do |assembly|
  Assembly.find_by_name("Inkless Pen (Metal)").parent_assemblies << assembly
  Assembly.find_by_name("Ink Cartridge (Black)").parent_assemblies << assembly
end

Assembly.find_or_create_by!(name: "Pen (Red, Plastic)") do |assembly|
  Assembly.find_by_name("Inkless Pen (Plastic)").parent_assemblies << assembly
  Assembly.find_by_name("Ink Cartridge (Red)").parent_assemblies << assembly
end

Assembly.find_or_create_by!(name: "Pen (Blue, Plastic)") do |assembly|
  Assembly.find_by_name("Inkless Pen (Plastic)").parent_assemblies << assembly
  Assembly.find_by_name("Ink Cartridge (Blue)").parent_assemblies << assembly
end

Assembly.find_or_create_by!(name: "Pen (Black, Plastic)") do |assembly|
  Assembly.find_by_name("Inkless Pen (Plastic)").parent_assemblies << assembly
  Assembly.find_by_name("Ink Cartridge (Black)").parent_assemblies << assembly
end

Assembly.find_or_create_by!(name: "Boxed Pen (Black, Plastic)") do |assembly|
  Assembly.find_by_name("Pen (Black, Plastic)").parent_assemblies << assembly
  Assembly.find_by_name("Pen Box").parent_assemblies << assembly
end

Assembly.find_or_create_by!(name: "Boxed Pen (Blue, Plastic)") do |assembly|
  Assembly.find_by_name("Pen (Blue, Plastic)").parent_assemblies << assembly
  Assembly.find_by_name("Pen Box").parent_assemblies << assembly
end

Assembly.find_or_create_by!(name: "Boxed Pen (Red, Plastic)") do |assembly|
  Assembly.find_by_name("Pen (Red, Plastic)").parent_assemblies << assembly
  Assembly.find_by_name("Pen Box").parent_assemblies << assembly
end

Assembly.find_or_create_by!(name: "Boxed Pen (Black, Metal)") do |assembly|
  Assembly.find_by_name("Pen (Black, Metal)").parent_assemblies << assembly
  Assembly.find_by_name("Pen Box").parent_assemblies << assembly
end

Assembly.find_or_create_by!(name: "Boxed Pen (Blue, Metal)") do |assembly|
  Assembly.find_by_name("Pen (Blue, Metal)").parent_assemblies << assembly
  Assembly.find_by_name("Pen Box").parent_assemblies << assembly
end

Assembly.find_or_create_by!(name: "Boxed Pen (Red, Metal)") do |assembly|
  Assembly.find_by_name("Pen (Red, Metal)").parent_assemblies << assembly
  Assembly.find_by_name("Pen Box").parent_assemblies << assembly
end
