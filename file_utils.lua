local utils = {}

utils.slash = package.config:sub(1, 1)

local function getOS()
	if utils.slash == "\\" then
		return "windows"
	end
	if utils.slash == "/" then
		return "unix"
	end

	print("Error: unknown type of OS!")
	os.exit(1)
end

utils.osType = getOS()

function utils.fileExists(file)
	local ok, err, code = os.rename(file, file)
	if code == 13 then -- permission denied, file exists
		return true
	end
	return ok, err
end

function utils.directoryExists(dir)
	local slashes = utils.osType == "windows" and "\\" or "/"
	return utils.fileExists(dir .. slashes)
end

function utils.createDirectory(dir)
	os.execute("mkdir " .. dir)
end

function utils.getListOfFiles(dir)
	local files = {}
	local loop = utils.osType == "windows" and 'dir "' .. dir .. '" /b' or "ls -pa " .. dir .. " | grep -v /"

	for file in io.popen(loop):lines() do
		files[#files + 1] = file
	end

	return files
end

function utils.getScriptDir()
	local dir = debug.getinfo(2, "S").source
	if dir:sub(1, 1) == "@" then
		dir = dir:sub(2)
	end

	local path
	if not dir:match("^/") or not dir:match("^%a:") then
		path = (os.getenv("PWD") or io.popen("cd"):read("*l")) .. "/" .. dir
	else
		path = dir
	end

	path = path:gsub(utils.slash, "/")

	return dir:match("(.*/)")
end

function utils.expandPath(path)
	if path:sub(1, 1) == "~" then
		local home = os.getenv("HOME") or "~"
		path = home .. path:sub(2)
	end

	path = path:gsub("%$(%w+)", function(env)
		return os.getenv(env) or ("$" .. env)
	end)

	return path
end

return utils
