# Simple interactive graphical editor
Graphical editor allow users to edit images.

## Table of contents
- General Info
- Technologies Used
- Usage

## General info
The input consists of a line containing a sequence of commands. Each command is represented by a single capital letter at the start of the line. Arguments to the command are separated by spaces and follow the command character.

## Technologies Used

- Ruby 3.0.2p107

## Usage
The editor supports 7 commands:
1. I M N. Create a new M x N image with all pixels colored white (O).
2. C. Clears the table, setting all pixels to white (O).
3. L X Y C. Colors the pixel (X,Y) with color C.
4. V X Y1 Y2 C. Draw a vertical segment of color C in column X between rows Y1 and Y2 (inclusive).
5. H X1 X2 Y C. Draw a horizontal segment of color C in row Y between columns X1 and X2
(inclusive).
6. F X Y C. Fill the region R with the color C. R is defined as: Pixel (X,Y) belongs to R. Any other pixel which is the same color as (X,Y) and shares a common side with any pixel in R also belongs to this region.
7. S. Show the contents of the current image.
8. X. Terminate the session.

> Written with [StackEdit](https://stackedit.io/).
