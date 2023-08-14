f = open("PUTNAM_A_PIT_CENTER_enu.csv", "r")
lines = f.readlines()
f.close()

# Remove the first line
lines.pop(0)

# Each of the remaining lines is a comma-separated list of 3 values
# representing the x, y, and z coordinates of a point on the center line

# Now, remove the last coordinate (z) from each line - we don't need it

# Create a new list to hold the x and y coordinates
xy_center_lines = []

for line in lines:
    # Split the line into a list of 3 values
    values = line.split(",")

    # Remove the last value (z coordinate)
    values.pop(2)

    # Convert back to a string
    line = ",".join(values) + "\n"

    # Add the line to the list
    xy_center_lines.append(line)

# Sample xy_center_lines to include every 5th line
# xy_center_lines = xy_center_lines[::5]

# Now, write the list to a new file
f = open("PUTNAM_A_PIT_CENTER_xy_enu.csv", "w")
f.writelines(xy_center_lines)