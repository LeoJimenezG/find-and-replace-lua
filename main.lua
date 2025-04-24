local welcome_message = "\n>>>>> WARNING: Make sure to paste your text into the 'data.txt' file before doing anything else, and, in the first line paste the element to find! <<<<<\n"

local options = [[
--------------- AVAILABLE OPTIONS ---------------
1. Replace all occurrences found
2. Replace all occurrences from a starting position to the end
3. Replace all occurrences from the start to an ending position
4. Count all occurrences
5. Replace and Count all occurrences
6. Exit
]]

local function show_options ()
    print(options)
end

local function get_file_content ()
    local file = io.open("data.txt", "r")
    if file ~= nil then
        local file_lines = {}
        for line in file:lines() do
            table.insert(file_lines, line)
        end
        file:close()
        return file_lines
    end
    return nil
end

local function ask_user_option (element)
    show_options()
    local option = tonumber(io.read())
    if option > 0 and option < 7 then
        print("-> You selected the option number: " .. "'" .. tostring(option) .. "'\n")
        return option
    else
        return ask_user_option(element)
    end
end

local function main()
    local file_data = get_file_content()
    if file_data ~= nil then
        local element = file_data[1]
        print("-> This is the element to be used: " .. "'" .. tostring(element) .. "'\n")
        local user_option = ask_user_option(element)
    end
end


print(welcome_message)
main()
