#!/usr/bin/env lua
local mfr = require "mfr.lua"
local utf8 = require 'lua-utf8'
local functions = require "functions"
file = functions.read_file("words.list")
if not file then
	io.write("File not found")
	os.exit(2)
end
error_stats = {}
wordlist = mfr.split(file, "\n")
task = functions.create_task(wordlist, 12)
table.sort(task)
for _, value in ipairs(task) do
	value = utf8.lower(value)
	mfr.pprint(value .. "\n")
end
input = mfr.split(io.read())
if #input ~= #task then
	io.write("Not enough answers entered")
	os.exit(1)
end
all_correct = true
for index, value in ipairs(task) do
	if value ~= input[index] then
		table.insert(error_stats, value)
		wrong_msg = mfr.set_bg(input[index], "red", true)
		right_msg = mfr.set_bg(value, "green", true)
		io.write(wrong_msg .. " -> " .. right_msg .. "\n")
		all_correct = false
	end
end
if all_correct then
	mfr.pprint(mfr.set_fg("all correct\n", "green"))
end
