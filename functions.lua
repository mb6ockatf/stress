functions = {}
local open = io.open

function functions.read_file(path)
	local file = open(path, "rb")
	if not file then
		return nil
	end
	local content = file:read "*a"
	file:close()
	return content
end

function functions.create_task(wordlist, number)
	if not number then
		number = 5
	end
	values = {math.random(#wordlist)}
	for i = 1, number - 1 do
		current_index = math.random(#wordlist)
		while mfr.belongs(current_index, values) do
			current_index = math.random(#wordlist)
		end
		table.insert(values, current_index)
	end
	for index, value in ipairs(values) do
		values[index] = wordlist[value]
	end
	return values
end

function functions.arrayEqual(a1, a2)
	if #a1 ~= #a2 then
		return false
	end
	for i, v in ipairs(a1) do
		if v ~= a2[i] then
			return false
		end
	end
	return true
end

return functions
