J = path.join

function dasc_target(t)
  local DASC = LUA_EXE .. ' ' .. path.join('dynasm', 'dynasm.lua')
  local dasc_h = {}
  for name, args in pairs(t) do
    local dasc = target(name .. ".h", args[1] .. ".dasc", DASC .. ' ' .. (args[2] or "") .. ' -o $(TARGET) $(DEPENDS) ')
    table.insert(dasc_h, dasc)
  end
  return dasc_h
end

function copy(dst, src)
  return target(dst, src, '$(COPY) $(DEPENDS) $(TARGET)')
end

function run(runner, file, cwd)
  print()
  print("run " .. file)
  if not TESTING then
    if cwd then lake.chdir(cwd) end
    local status, code = utils.execute( runner .. ' ' .. file )
    if cwd then lake.chdir("<") end
    print()
    return status, code
  end
  return true, 0
end

function run_test(runner, name, params)
  local test_dir = '.'
  local cmd = J(test_dir, name)
  if params then cmd = cmd .. ' ' .. params end
  local ok = run(runner, cmd, test_dir)
  print("TEST " .. name .. (ok and ' - pass!' or ' - fail!'))
end
