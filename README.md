# Knights Travails

## Overview

Project for The Odin Project (https://www.theodinproject.com/) as part of the Fundamental Computer Science section. 

In chess, a knight is able to move to any spot on the standard 8x8 chess board from any other square on the board, given enough turns:

![chessboard](https://cdn.statically.io/gh/TheOdinProject/curriculum/284f0cdc998be7e4751e29e8458323ad5d320303/ruby_programming/computer_science/project_knights_travails/imgs/00.png)

The goal of this project was to develop a program which was able to calculate the shortest path that a knight is able to take between two positions on a chess board. The attached driver.rb contains some example code.

Provided a starting position and ending position, the #knight_moves method will calculate the shortest path using BFS and return the number of moves and the path taken:

```
> knight_moves([3,3],[4,3])
=> You made it in 3 moves!  Here's your path:
  [3,3]
  [4,5]
  [2,4]
  [4,3]
```
