import argparse


parser = argparse.ArgumentParser(description="LIB generator")
parser.add_argument("--input", "-i", type=str, help="Input LEF file", required=True)
parser.add_argument("--output", "-o", type=str, help="Output LEF file", required=True)
parser.add_argument("--margin", "-m", type=float, default=0.009, help="Margin for OBS")
parser.add_argument("--obs_layer", "-l", type=str, default="BPR", help="Layer for OBS")

args = parser.parse_args()

lines = []
with open(args.input, "r") as f:
    lines = f.readlines()
    f.close()
    
macro_name = ""
obs_found = False
size_found = False
width = 0
height = 0
modified_lines = []

for i in range(len(lines)):
    line = lines[i]
    if line.upper().startswith("MACRO"):
        macro_name = line.split()[1]
        obs_found = False
        size_found = False
        modified_lines.append(line)
    elif macro_name != "" and line.upper().startswith("END"):
        assert line.split()[1] == macro_name
        if not obs_found:
            modified_lines.append("  OBS\n")
            modified_lines.append("    LAYER %s ;\n" % args.obs_layer)
            modified_lines.append("      RECT %f %f %f %f ;\n" % (0, args.margin, width, height - args.margin))
            modified_lines.append("  END\n")
        modified_lines.append(line)
        macro_name = ""
    elif line.strip().startswith("SIZE"):
        size_found = True
        width = float(line.strip().split()[1])
        height = float(line.strip().split()[3])
        modified_lines.append(line)
    elif line.strip().startswith("OBS"):
        obs_found = True
        modified_lines.append(line)
        modified_lines.append("    LAYER %s ;\n" % args.obs_layer)
        modified_lines.append("      RECT %f %f %f %f ;\n" % (0, args.margin, width, height - args.margin))
    else:
        modified_lines.append(line)

with open(args.output, "w") as f:
    f.writelines(modified_lines)
    f.close()
        
    
        

