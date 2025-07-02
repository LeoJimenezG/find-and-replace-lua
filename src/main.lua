local welcome_message = "\n>>>>> WARNING: Make sure the 'data.txt' file is properly formatted. For more information go to the 'README.md' file! <<<<<\n"

local options = [[
--------------- AVAILABLE OPTIONS ---------------
1. Replace all occurrences found
2. Count all occurrences
3. Replace and Count all occurrences
4. Exit
]]

local function show_options ()
    print(options)
end

local function get_file_content ()
    local file = io.open("files/data.txt", "r")
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

local function ask_user_option ()
    show_options()
    local option = tonumber(io.read())
    if option > 0 and option < 5 then
        return option
    else
        return ask_user_option()
    end
end

local function write_new_file (new_content)
    local output = io.open("files/output.txt", "w")
    if output == nil then
        print("\n>>>>> Error: The 'output.txt' file was not found! <<<<<\n")
        return false
    end
    for i = 1, #new_content do
        output:write(new_content[i])
        output:write("\n")
    end
    output:close()
    return true
end

local function replace_all_occurrences (file_content)
    local element_to_find = file_content[1]
    local element_to_use = file_content[2]
    local new_content = {}
    for i = 3, #file_content do
        local new_line, _ = string.gsub(file_content[i], element_to_find, element_to_use)
        table.insert(new_content, new_line)
    end
    return new_content
end

local function count_all_occurrences (file_content)
    local element = file_content[1]
    local total_occurrences = 0
    for i = 3, #file_content do
        local _, occurrences = string.gsub(file_content[i], element, element)
        total_occurrences = total_occurrences + occurrences
    end
    return total_occurrences
end

local function replace_and_count_all (file_content)
    local element_to_find = file_content[1]
    local element_to_use = file_content[2]
    local total_occurrences = 0
    local new_content = {}
    for i = 3, #file_content do
        local new_line, occurrences = string.gsub(file_content[i], element_to_find, element_to_use)
        total_occurrences = total_occurrences + occurrences
        table.insert(new_content, new_line)
    end
    return new_content, total_occurrences
end

local function main()
    local file_data = get_file_content()
    if file_data ~= nil then
        print("NOTE: This is the element to be found: " .. "'" .. tostring(file_data[1]) .. "'")
        print("NOTE: This is the element to be used: " .. "'" .. tostring(file_data[2]) .. "'\n")
        local user_option = ask_user_option()
        if user_option == 1 then
            local new_content = replace_all_occurrences(file_data)
            print("->> All occurrences replaced! <<-\n")
            write_new_file(new_content)
        elseif user_option == 2 then
            local total_occurrences = count_all_occurrences(file_data)
            print("->> Total occurrences found: " .. total_occurrences .. " <<-\n")
        elseif user_option == 3 then
            local new_content, total_occurrences = replace_and_count_all(file_data)
            print("->> All occurrences replaced! <<-")
            print("->> Total occurrences found: " .. total_occurrences .. " <<-\n")
            write_new_file(new_content)
        else
            print("->> Bye! <<-\n")
        end
    else
        print("\n>>>>> Error: No file content provided! <<<<<\n")
    end
end

print(welcome_message)
main()
