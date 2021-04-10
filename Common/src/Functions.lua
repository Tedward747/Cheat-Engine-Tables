function init(t)
  aobScanRegion = decodeFunction(t.aobScanRegion)
  checkForUpdate = decodeFunction(t.checkForUpdate)
  error_mr = decodeFunction(t.error_mr)
  mono_findClassByFullName = decodeFunction(t.mono_findClassByFullName)
  mono_findMethodByArgCount = decodeFunction(t.mono_findMethodByArgCount)
end

function aobScanRegion(SYMBOL, START, END, AOB)
  local CODE = [[aobScanRegion(%s, %s, %s, %s)
  registerSymbol(%s)]]

  if type(START) == 'number' then START = ('%X'):format(START) end
  if type(END) == 'number' then END = ('%X'):format(END) end
  CODE = CODE:format(SYMBOL, START, END, AOB, SYMBOL)

  if not autoAssemble(CODE) then return nil end
  return 1
end

function checkForUpdate(game, currentVersion)
  updateCheckThread = createThread(function(t)
    local i = getInternet('UpdateCheck')
    local r = i.getURL('https://raw.githubusercontent.com/Tedward747/Cheat-Engine-Tables/main/' .. game .. '/latestversion.txt')

    if r ~= currentVersion then
      t.synchronize(function()
        al=getAddressList()
        newMR=al.createMemoryRecord();
        newMR2=al.createMemoryRecord();
        newMR3=al.createMemoryRecord();
        newMR.Description = "Update Available, you're on " .. currentVersion .. ", latest is " .. r
        newMR2.Description = "<-- Open Github"
        newMR2.OnActivate = function()
          ShellExecute('https://github.com/Tedward747/Cheat-Engine-Tables/tree/main/' .. game)
        end
        newMR3.Description = "<-- Download new version to Desktop"
        newMR3.OnActivate = function()
          os.execute('curl https://raw.githubusercontent.com/Tedward747/Cheat-Engine-Tables/main/' .. game .. '/' .. game .. '.CT >%userprofile%\\desktop\\' .. game .. '-' .. r .. '.CT')
          local f = io.open(os.getenv('userprofile') .. '\\desktop\\' .. game .. '-' .. r .. '.CT','r')
          if f == nil then
            messageDialog('File download failed, please try again or download manually',mtError,mbOK)
          else
            io.close(f)
            local resp = messageDialog('New table downloaded, would you like to load it now?',mtConfirmation,mbYes,mbNo)
            if resp == 6 then
              -- loadTable(os.getenv('userprofile') .. '\\desktop\\' .. game .. '-' .. r .. '.CT')
              os.execute('%userprofile%\\desktop\\' .. game .. '-' .. r .. '.CT')
              os.exit()
            end
          end
        end
        newMR2.appendToEntry(newMR)
        newMR3.appendToEntry(newMR)
        local i = 0
        local timer = createTimer()
        timer.Interval = 500
        timer.OnTimer = function(timer)
          if i % 2 == 0 then
            newMR.Color = 255
          else
            newMR.Color = 16711935
          end
          i = i + 1
          if i == 6 then timer.destroy() end
        end
      end)
    end

    i.destroy()
  end)
end

function error_mr(ID)
  local mr = getAddressList().getMemoryRecordByID(ID)
  mr.setDescription("Disabled, can't find method: " .. mr.Description)
  mr.Type = 0
end

function mono_findClassByFullName(namespace, shortname, fullname)
  local assemblies = mono_enumAssemblies()
  local cs=0
  if assemblies then
    for i=1,#assemblies do
      local image = mono_getImageFromAssembly(assemblies[i])
      if image and (image~=0) then
        local imagename = mono_image_get_name(image)
        if imagename and imagename == namespace then
          cs = image
          break
        end
      end
    end
  end
  if cs == 0 then return nil end
  local classes =  mono_image_enumClasses(cs)
  if classes and (classes~=0) then
    for i=1,#classes do
      if classes[i].classname == shortname then
        local class = mono_class_getFullName(classes[i].class)
        if class == fullname then
          return classes[i].class
        end
        --print('class# ' .. classes[i].class .. ' short name ' .. classes[i].classname .. ' namespace? ' .. classes[i].namespace .. ' fqn ' .. class)
      end
    end
  end
  return nil
end

function mono_findMethodByArgCount(namespace, classname, methodname, arguments)
  if namespace==nil or classname==nil or methodname==nil or arguments==nil then
    return nil,'invalid parameters'
  end

  local class=mono_findClass(namespace, classname)
  if class and (class~=0) then
    local methods = mono_class_enumMethods(class)
    for i=1, #methods do
      if methods[i].name == methodname then
        local count = 0
        local signature = mono_method_getSignature(methods[i].method)
        if #signature ~= 0 then
          for m in string.gmatch(signature, "[^,]+") do count=count+1 end
        end
        if count == arguments then
          return methods[i].method
        end
      end
    end
  end
  return 0
end

print('return {\n{')

print('  ["init"]="' .. encodeFunction(init) .. '",')
print('  ["aobScanRegion"]="' .. encodeFunction(aobScanRegion) .. '",')
print('  ["checkForUpdate"]="' .. encodeFunction(checkForUpdate) .. '",')
print('  ["error_mr"]="' .. encodeFunction(error_mr) .. '",')
print('  ["mono_findClassByFullName"]="' .. encodeFunction(mono_findClassByFullName) .. '",')
print('  ["mono_findMethodByArgCount"]="' .. encodeFunction(mono_findMethodByArgCount) .. '",')

print('},\n}')