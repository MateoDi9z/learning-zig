# Episode 1 - Project Setup

How to setup and run a new zig project.

## Contents

- [File Structure](#file-structure)
- [Basic Commands](#basic-commands)
  - [Project Setup](#project-setup)
  - [Development](#development)
  - [Testing](#testing)
  - [Arguments](#arguments)
- [Zig Basics](#zig-basics)

## File Structure

- `/src`: The source code of the project. It contains main.zig file which is the entry point for the program
- `/zig-cache`: The cache directory used by zig to store a cache of compiled files
- `/zig-out`: The output directory used by zig to store compiled files
- `build.zig`: The build configuration file

## Basic Commands

### Project Setup

- zig init; Initialize project template

### Development

- zig build; Build the project
- zig build run; Build and run the project

### Testing

- zig build test; Test the project build, no output means all tests passed
- zig build test _--summary all_; Test the project build with summary output (show each test result)

### Arguments

_--summary all_; can be used in zig test, zig build & zig build run, to output summary

## Zig Basics

This project uses common .gitignore and .gitattributes. Copy and paste these to your project root dir.

Zig language is used for creating not only compiled (_".exe"_) files but also libraries (_".a"_).
